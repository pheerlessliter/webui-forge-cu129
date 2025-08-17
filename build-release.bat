@echo off
setlocal

:: Set paths
set "REPO_DIR=%cd%"
set "RELEASE_ROOT=%cd%\..\forgeui-cu129-release-1.0.0"
set "PYTHON_SRC=%REPO_DIR%\venv"
set "PYTHON_DST=%RELEASE_ROOT%\system\python"
set "GIT_SRC=%REPO_DIR%\portable-git"
set "GIT_DST=%RELEASE_ROOT%\system\git"
set "TRANSFORMERS_SRC=%REPO_DIR%\transformers-cache"
set "TRANSFORMERS_DST=%RELEASE_ROOT%\system\transformers-cache"
set "WEBUI_DST=%RELEASE_ROOT%\webui"

:: 1. Remove previous build
if exist "%RELEASE_ROOT%" (
    echo Removing previous release...
    rmdir /s /q "%RELEASE_ROOT%"
)

:: 2. Copy portable Python
echo Copying Python environment...
robocopy "%REPO_DIR%\.git" "%WEBUI_DST%\.git" /E
robocopy "%REPO_DIR%\__pycache__" "%WEBUI_DST%\__pycache__" /E
robocopy "%REPO_DIR%\backend" "%WEBUI_DST%\backend" /E
robocopy "%REPO_DIR%\embeddings" "%WEBUI_DST%\embeddings" /E
robocopy "%REPO_DIR%\extensions" "%WEBUI_DST%\extensions" /E
robocopy "%REPO_DIR%\extensions-builtin" "%WEBUI_DST%\extensions-builtin" /E
robocopy "%REPO_DIR%\html" "%WEBUI_DST%\html" /E
robocopy "%REPO_DIR%\javascript" "%WEBUI_DST%\javascript" /E
robocopy "%REPO_DIR%\k_diffusion" "%WEBUI_DST%\k_diffusion" /E
robocopy "%REPO_DIR%\localizations" "%WEBUI_DST%\localizations" /E
robocopy "%REPO_DIR%\models" "%WEBUI_DST%\models" /E
robocopy "%REPO_DIR%\modules" "%WEBUI_DST%\modules" /E
robocopy "%REPO_DIR%\modules_forge" "%WEBUI_DST%\modules_forge" /E
robocopy "%REPO_DIR%\repositories" "%WEBUI_DST%\repositories" /E
robocopy "%REPO_DIR%\scripts" "%WEBUI_DST%\scripts" /E
robocopy "%REPO_DIR%\tmp" "%WEBUI_DST%\tmp" /E
robocopy "%REPO_DIR%\packages_3rdparty" "%WEBUI_DST%\packages_3rdparty" /E
if exist "%PYTHON_SRC%\python310.dll" copy "%PYTHON_SRC%\python310.dll" "%PYTHON_DST%\python310.dll"
if exist "%PYTHON_SRC%\pythonw.exe" copy "%PYTHON_SRC%\pythonw.exe" "%PYTHON_DST%\pythonw.exe"

:: 3. Copy top-level files
xcopy "%REPO_DIR%\*.*" "%WEBUI_DST%\" /D /Y /I

:: 4. Copy portable Python
echo Copying Python environment...
robocopy "%PYTHON_SRC%" "%PYTHON_DST%" /E

:: 5. Copy portable Git (if exists)
if exist "%GIT_SRC%" (
    echo Copying portable Git...
    robocopy "%GIT_SRC%" "%GIT_DST%" /E
)

:: 6. Copy transformers-cache (if exists)
if exist "%TRANSFORMERS_SRC%" (
    echo Copying transformers-cache...
    robocopy "%TRANSFORMERS_SRC%" "%TRANSFORMERS_DST%" /E
)

:: 7. Copy batch launchers and other top-level files
echo Copying launcher scripts...
copy "%REPO_DIR%\release-scripts\run.bat" "%RELEASE_ROOT%\run.bat"
copy "%REPO_DIR%\release-scripts\environment.bat" "%RELEASE_ROOT%\environment.bat"
copy "%REPO_DIR%\release-scripts\update.bat" "%RELEASE_ROOT%\update.bat"

:: 8. (Optional) Copy transformers-cache if you want to pre-populate it
if exist "%REPO_DIR%\transformers-cache" (
    robocopy "%REPO_DIR%\transformers-cache" "%RELEASE_ROOT%\system\transformers-cache" /E
)

:: 9. Clean up unnecessary files
echo Cleaning up unnecessary files...
REM Remove all __pycache__ folders recursively
for /d /r "%RELEASE_ROOT%" %%d in (__pycache__) do (
    if exist "%%d" rmdir /s /q "%%d"
)

REM Remove all tests folders recursively
for /d /r "%RELEASE_ROOT%" %%d in (tests) do (
    if exist "%%d" rmdir /s /q "%%d"
)

echo Release built at %RELEASE_ROOT%
endlocal
pause

:: Compression instructions
:: 7z
:: 9 - Ultra
:: LZMA2
:: Dictionary 1024mb
:: Word 256
:: Solid
:: Max Threads
:: 80% Mem Usage
