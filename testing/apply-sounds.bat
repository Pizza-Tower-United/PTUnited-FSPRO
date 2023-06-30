@echo off

for %%i in ("%~dp0.") do SET "pwd=%%~fi"

set "gamedir=C:/Program Files (x86)/Steam/steamapps/common/Pizza Tower"
set /p "gamedir=Enter game directory or just ENTER for default [%gamedir%] : "

rmdir "%gamedir%/sound-united-testing"
mklink /D "%gamedir%/sound-united-testing" "%pwd%/Build"

if not exist "%gamedir%/import_banks_old.txt" (
	rename "%gamedir%/import_banks.txt" "%gamedir%/import_banks_old.txt"
)

copy "./import_banks.txt" "%gamedir%/import_banks.txt"

echo Done!
pause