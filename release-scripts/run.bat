@echo off

call environment.bat

cd %~dp0webui
echo Starting web UI. This may take a while, especially on first run. Please be patient!
call webui-user.bat
