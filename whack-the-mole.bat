@echo off
mode con: cols=70 lines=20

title Whac-A-Mole Game

echo Press any key to start the game...
pause >nul

setlocal enabledelayedexpansion

set /a score=0
set /a time=30

:game_loop
cls
echo Score: !score!
echo Time Left: !time! seconds

set /a pos=!random! %% 9 + 1

for /l %%i in (1,1,9) do (
  if %%i equ !pos! (
    set "cell=O"
  ) else (
    set "cell=X"
  )
  set "line=!line!!cell!"
)

echo !line!
set "line="

set /p input="Whac which mole (1-9)? "
if "%input%"=="" goto game_loop
if not "%input:~0,1%" gtr "0" if not "%input:~0,1%" lss "9" (
  if %input% equ %pos% (
    echo Whacked it!
    set /a score+=1
  ) else (
    echo Missed!
  )
)

set /a time-=1
if %time% gtr 0 goto game_loop

echo Game Over!
echo Your final score is: !score!

pause >nul
