@echo off

cls

echo Java Installation Path :
 

for /F "eol=^ tokens=*" %%i in ('where /F java') do (
   call :process %%i
)


:process

 set str1=%1
 set str2= "jdk1.7"

 IF [%1] == [] GOTO IGNORE_WHITE_SPACE
  
 
 CALL :FIND_MY_JAVA %str1% %str2%
  

 IF %result% == 0 (
    echo %str2% is Found in JDK: "%str1%".
 ) ELSE (
    echo %str2% not found.
 )



:: Returns YES => 0 | NO => 1
 
:FIND_MY_JAVA
   SETLOCAL
      set lookup= "jdk1.7"

      echo %1 | findstr /i %lookup%  > nul
 

   ENDLOCAL & SET result=%errorlevel%


 


:IGNORE_WHITE_SPACE
