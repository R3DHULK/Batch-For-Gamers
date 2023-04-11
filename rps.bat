@echo off

set /a wins=0
set /a losses=0
set /a ties=0

:game_loop
cls
echo Rock Paper Scissors Game
echo.
echo Wins: %wins%
echo Losses: %losses%
echo Ties: %ties%
echo.
echo Choose your move:
echo [1] Rock
echo [2] Paper
echo [3] Scissors
echo [4] Quit
set /p choice=

:: Validate the input
if %choice% equ 4 (
  goto end_game
)
if %choice% lss 1 (
  goto invalid_input
)
if %choice% gtr 3 (
  goto invalid_input
)

:: Generate the computer's move
set /a computer_choice=!random! %% 3 + 1

:: Determine the winner
if %choice% equ 1 (
  if %computer_choice% equ 1 (
    set /a ties+=1
    echo You chose Rock. The computer chose Rock. It's a tie!
  ) else if %computer_choice% equ 2 (
    set /a losses+=1
    echo You chose Rock. The computer chose Paper. You lose!
  ) else (
    set /a wins+=1
    echo You chose Rock. The computer chose Scissors. You win!
  )
) else if %choice% equ 2 (
  if %computer_choice% equ 1 (
    set /a wins+=1
    echo You chose Paper. The computer chose Rock. You win!
  ) else if %computer_choice% equ 2 (
    set /a ties+=1
    echo You chose Paper. The computer chose Paper. It's a tie!
  ) else (
    set /a losses+=1
    echo You chose Paper. The computer chose Scissors. You lose!
  )
) else if %choice% equ 3 (
  if %computer_choice% equ 1 (
    set /a losses+=1
    echo You chose Scissors. The computer chose Rock. You lose!
  ) else if %computer_choice% equ 2 (
    set /a wins+=1
    echo You chose Scissors. The computer chose Paper. You win!
  ) else (
    set /a ties+=1
    echo You chose Scissors. The computer chose Scissors. It's a tie!
  )
)

pause >nul
goto game_loop

:invalid_input
echo Invalid input! Please choose a number between 1 and 4.
pause >nul
goto game_loop

:end_game
cls
echo Rock Paper Scissors Game
echo.
echo Wins: %wins%
echo Losses: %losses%
echo Ties: %ties%
echo.
echo Thanks for playing!
pause >nul
