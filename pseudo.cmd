@echo OFF
echo.
@REM set PYHOME=python-3.9.10-embed-amd64/
if "%1" == "--help" ( goto commands-help goto terminate)
if "%1" == "view-date" ( goto date-view goto terminate )
if "%1" == "reload" ( goto reload goto terminate )
if "%1" == "view-time" ( goto time-view goto terminate) 
if "%1" == "--version" ( goto version goto terminate) 
if "%1" == "view-basic" (goto basic-view goto terminate) 
if "%1" == "view-dev" (goto dev-view goto terminate) 
if "%2" == "--test"  goto testcase 
if "%2" == "--edit"  (notepad "./playground/%1" goto terminate) 
if "%1" == "" ( goto help ) else ( goto normal )

:: this function goes to the documentation dir and returns to the previous dir after printing from  a file 
:help
CD "./*tion/ " 
type "file" 
CD ".."
goto terminate

:normal
%python3% "compile.py" "%1"
goto terminate

:testcase
%python3% "algo.py" "%3" "%1"
goto terminate

:basic-view
attrib +h +s *
attrib +h +s Documentation
attrib +h +s container
attrib -h -s setup.cmd
attrib -h -s RUN.exe
echo configuration files hidden for basic use
goto terminate

:dev-view
attrib -h -s *
attrib -h -s Documentation
attrib -h -s container
echo Happy debugging ;-)
goto terminate

:time-view
echo %TIME%
goto terminate

:date-view
echo %DATE%
goto terminate

:commands-help
CD "./*tion/ "
type "commands"
CD ..
goto terminate

:version
echo version 1.0.3

:reload
CHDIR %PSEUDOHOME% 
echo loaded
PseudoApp
goto terminate

:terminate
echo.
