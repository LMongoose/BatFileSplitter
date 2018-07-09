REM Windows Batch File Splitter. by LMongoose 
REM use split.bat <sourcefile> <number_of_lines> <prefix_of_result_files>

@echo off
setlocal ENABLEDELAYEDEXPANSION

REM Target file and extension 
SET BFN=%1
REM Number of lines per file.
SET LPF=%2
REM Result file prefix 
SET SFN=%3

REM Gets the BigFile extension
SET SFX=%BFN:~-3%
REM set start line and start file
SET /A LineNum=0
SET /A FileNum=1

REM For each line in BigFile (May be 1 or 2 equalsigns)
For /F "delims=" %%l in (%BFN%) Do (
	REM Increase line
	SET /A LineNum+=1
	REM Insert line on created file
	echo %%l >> %SFN%!FileNum!.%SFX%
	REM If reached max lines per file, reset line and go to next file
	if !LineNum! EQU !LPF! (
		SET /A LineNum=0
		SET /A FileNum+=1
	)	
)
endlocal
Pause