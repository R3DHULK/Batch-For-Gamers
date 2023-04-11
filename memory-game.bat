@echo off

title Memory Game

setlocal enabledelayedexpansion

echo Welcome to the Memory Game!
echo.
echo Press any key to start...
pause >nul

set /a level=1
set "sequence="
set "user_sequence="

:game_loop
cls
echo Level %level%
echo.

:: Generate the sequence
set "sequence="
for /l %%i in (1,1,%level%) do (
  set /a "random_num=!random! %% 9 + 1"
  set "sequence=!sequence!!random_num!"
)

:: Display the sequence
echo Remember this sequence:
echo !sequence!
timeout /t 2 >nul
cls

:: Get user input
set "user_sequence="
echo Your turn:
set /p "user_sequence="

:: Validate user input
if "%user_sequence%"=="!sequence!" (
  echo Correct!
  set /a level+=1
) else (
  echo Incorrect. Game Over!
  echo Your final level is %level%
  pause >nul
  exit
)

goto game_loop
