. .venv/bin/activate
python3 run.py \
-s "SingleBrowser" \
--resolution 1920x1080 \
--browser webkit \
--environment production \
--rerun-failed-only
deactivate