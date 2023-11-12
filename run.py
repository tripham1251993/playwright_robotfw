import argparse
import subprocess
import argparse
import subprocess
import sys
import os
import platform
from robot.api import logger

ap = argparse.ArgumentParser()
ap.add_argument(
    "-t",
    "--test",
    action="append",
    help="Enter test case name you want to run",
)

ap.add_argument(
    "-b",
    "--browser",
    type=str,
    default="chromium",
    help="Choose which browser to run test. Available browsers: chromium, firefox, webkit",
)

ap.add_argument("-i", "--include", action="append")
ap.add_argument("-e", "--exclude", action="append")
ap.add_argument("-v", "--variable", action="append")
ap.add_argument("-s", "--suite", type=str)
ap.add_argument("-f", "--folder", default=f"TestSuite", type=str)
ap.add_argument(
    "-r", "--rerun-failed", default=False, action=argparse.BooleanOptionalAction, help="Re-run failed or not"
)
ap.add_argument("-L", "--loglevel", default="INFO", help="Set debug level: TRACE, DEBUG, INFO")
ap.add_argument("--environment", default="staging", type=str, help="running on environment staging/production")
ap.add_argument("--consolecolors", default="ansi", help="console color")
ap.add_argument("-d", "--report-directory", default="Report", help="Set Report Directory")
ap.add_argument(
    "--rerun-failed-only", default=False, action=argparse.BooleanOptionalAction, help="Only rerun failed tests"
)
ap.add_argument("--debug", default=False, action=argparse.BooleanOptionalAction, help="Pause on failure for debugging")
ap.add_argument("--resolution", default="1920x1080", help="Set screen resolution, default: 1920x1080")
ap.add_argument("--headless", default=False, action=argparse.BooleanOptionalAction, help="Run Headless or not")
ap.add_argument(
    "--install-libraries", default=True, action=argparse.BooleanOptionalAction, help="Install Required Libraries"
)

args = vars(ap.parse_args())
browser = args.get("browser").lower()
includes = args.get("include")
excludes = args.get("exclude")
variables = args.get("variable")
suite = args.get("suite")
tests = args.get("test")
folder = args.get("folder")
rerun_failed = args.get("rerun_failed")
log_level = args.get("loglevel").upper()
consolecolors = args.get("consolecolors")
environment = args.get("environment")
report_dir = args.get("report_directory")
rerun_failed_only = args.get("rerun_failed_only")
debug = args.get("debug")
resolution = args.get("resolution")
headless = args.get("headless")
install_req_libs = args.get("install_libraries")

condition = platform.system().lower() in ["linux", "darwin"]
_python = "python3" if condition else "python"
_robot = "python3 -m robot" if condition else "robot"

base_command = f"{_robot} -d {report_dir} -L {log_level}"
extra_vars = ""
extra_vars += f" -v PAUSE4FAIL:{debug}"

if tests:
    for t in tests:
        base_command += f' -t "{t}"'

if suite:
    base_command += f' -s "{suite}"'

if variables:
    for v in variables:
        extra_vars += f" --variable {v}"

if includes:
    for i in includes:
        extra_vars += f' -i "{i}"'

if excludes:
    for e in excludes:
        extra_vars += f' -e "{e}"'

extra_vars += f" -v env:{environment}"
extra_vars += f" -v browser:{browser}"
extra_vars += f" -v resolution:{resolution}"
extra_vars += f" -v headless:{headless}"
extra_vars += f" --consolecolors {consolecolors} {folder}"
base_command += extra_vars

if install_req_libs:
    logger.info("Upgrade pip version", also_console=True)
    subprocess.run(f"{_python} -m pip install --upgrade pip", shell=True)
    logger.info("Install requirements", also_console=True)
    subprocess.run(f"{_python} -m pip install -r requirements.txt", shell=True)


def rerun_failed_test():
    rerun_command = f"""{_robot} --rerunfailed {report_dir}{os.sep}output.xml \
-o {report_dir}{os.sep}rerun_output.xml \
-r {report_dir}{os.sep}rerun_report.html \
-l {report_dir}{os.sep}rerun_log.html \
-L {log_level} {extra_vars}"""

    logger.info(f">>> Execute command: {rerun_command}", also_console=True)
    rerun_subprocess = subprocess.run(rerun_command, shell=True)

    merge = f"""rebot \
-o {report_dir}{os.sep}output.xml \
-r {report_dir}{os.sep}report.html \
-l {report_dir}{os.sep}log.html \
--merge \
{report_dir}{os.sep}output.xml {report_dir}{os.sep}rerun_output.xml"""

    logger.info(f">>> Execute command: {merge}", also_console=True)
    subprocess.run(merge, shell=True)

    return rerun_subprocess.returncode


if rerun_failed_only:
    return_code = rerun_failed_test()
else:
    logger.info(f">>> Execute command: {base_command}", also_console=True)
    sub_process = subprocess.run(base_command, shell=True)
    return_code = sub_process.returncode
    if return_code != 0 and rerun_failed:
        return_code = rerun_failed_test()

sys.exit(return_code)
