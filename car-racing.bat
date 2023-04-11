@echo off
title Car Racing Game

setlocal enabledelayedexpansion

:: Initialize variables
set "track_width=20"
set "player_position=10"
set "opponent_position=10"
set "player_score=0"
set "opponent_score=0"

:game_loop
cls
echo Car Racing Game
echo.
echo Score: Player - %player_score% Opponent - %opponent_score%
echo.
echo Track:
echo +!track_width!-
set "track="
for /l %%i in (1,1,!track_width!) do set "track=!track!-"
echo +%track%+
echo.
echo Player:
echo  !player_position!  ▲
echo.
echo Opponent:
echo  !opponent_position!  ▲
echo.
echo Instructions:
echo Press 'A' to move left, 'D' to move right, or 'X' to quit.
echo.
choice /c adx >nul

:: Move player car
if "%errorlevel%"=="1" (
  set /a "player_position-=1"
) else if "%errorlevel%"=="2" (
  set /a "player_position+=1"
) else if "%errorlevel%"=="3" (
  echo Game Over!
  echo Your final score is %player_score%
  pause >nul
  exit
)

:: Move opponent car
set /a "opponent_position+=1"
if !opponent_position! geq !track_width! (
  set "opponent_position=1"
  set /a "opponent_score+=1"
)

:: Check for collision
if !player_position! equ !opponent_position! (
  echo Collision! Game Over!
  echo Your final score is %player_score%
  pause >nul
  exit
)

:: Increase player score
set /a "player_score+=1"

goto game_loop
