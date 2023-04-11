@echo off

set /a score=0

echo Welcome to the Trivia Game!
echo.
echo Question 1: What is the capital of France?
echo [A] Paris
echo [B] Berlin
echo [C] London
echo [D] Madrid
set /p answer1=

:: Validate the input and update the score
if /i "%answer1%"=="A" (
  echo Correct!
  set /a score+=1
) else (
  echo Incorrect. The answer is Paris.
)

echo.
echo Question 2: Who is the founder of Microsoft?
echo [A] Steve Jobs
echo [B] Bill Gates
echo [C] Jeff Bezos
echo [D] Mark Zuckerberg
set /p answer2=

:: Validate the input and update the score
if /i "%answer2%"=="B" (
  echo Correct!
  set /a score+=1
) else (
  echo Incorrect. The answer is Bill Gates.
)

echo.
echo Question 3: Which planet is known as the Red Planet?
echo [A] Earth
echo [B] Mars
echo [C] Jupiter
echo [D] Saturn
set /p answer3=

:: Validate the input and update the score
if /i "%answer3%"=="B" (
  echo Correct!
  set /a score+=1
) else (
  echo Incorrect. The answer is Mars.
)

echo.
echo Your final score is %score% out of 3.
pause >nul
