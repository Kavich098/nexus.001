@echo off
chcp 65001 >nul
cd /d "%~dp0"

where cl >nul 2>&1
if errorlevel 1 (
    echo ERROR: cl.exe not found. Run this from the VS 2022 Developer Command Prompt.
    pause
    exit /b 1
)

cl /nologo /std:c++17 /utf-8 /EHsc nexus_v0.6.cpp /link Shell32.lib User32.lib sapi.lib ole32.lib winmm.lib libvosk.lib
if errorlevel 1 (
    pause
    exit /b 1
)

nexus_v0.6.exe
pause
