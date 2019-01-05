REM @echo off

REM ==================================
REM  Unity Build
REM ==================================
"c:\Program Files\Unity\Hub\Editor\2018.2.14f1\Editor\Unity.exe" ^
	-projectPath ../movie_flutter_unity ^
	-executeMethod BuildClass.AppBuild ^
	-batchmode ^
	-quit ^
	-logFile ../temp/unity_build_log.log
