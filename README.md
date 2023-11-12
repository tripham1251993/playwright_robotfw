# rf_playwright
---
## Introduction
This project with main purpose is to use robotframework with playwright to do automation testing

## Project structure
```
rf_playwright/                      # root project directory
├── core_lib/                               # libs directory
│   └── utilities.py                        # utilities
├── data/                                   # data directory
├── Lcators/                                # locator directory
├── Resources/                              # RF resouces / keywords folder
├── pyproject.toml                          # Configuration file for black tool and other tools
├── README.md                               # README
├── requirements.txt                        # store all required python libs
├── run.py                                  # run helper file that used to run tests
└── TestSuite/                              # test root directory
    ├── SingleBrowser.robot                 # sample test config to run test all test casses in suite with single browser (single session)
    ├── TestLogin.robot                     # sample test suite for login page
    └── TestOpenMenu.robot                  # sample test suite that test open main menu after logged in
```

## Setup environment
- You have to install nodejs, npm, python 3.9+ 
```shell
# open git bash if you use windows
# run command
chmod a+x *.sh
# install requirements libraries
# allure commandline, python libs
./install.sh
```

## Run test script
- using `run.py` to run tests:
    + It will install required libraries
    + Cleanup old report
    + Update list scenarios / test steps definition to ensure new features / steps added
    + Check and reformat code
    + Check linting
    + Then run tests with your expected variables
```shell
# for more information about options run: python3 run.py -h
python3 run.py \
--resolution 1920x1080 \   # setting up browser's resolution
-s suite_namme \           # Suite name (without .robot)
-t test_name \             # run test by test name, can use multiple -t test_name to run multiple test cases
--browser chromium \       # browser to running on (chormium, firefox, webkit)
--install-libraries \      # install required libs (use --no-install-libraries to let it don't install requirements)
--exclude sample_test \    # exclude running test by tag, can use multiple --exclude to exclude multiple tags
--headless \               # to let it run on headless mode or no headless (--no-headless to let it run without headless)
--environment staging      # environment to run test on (staging , production)
```