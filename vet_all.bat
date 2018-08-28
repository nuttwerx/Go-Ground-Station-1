@ECHO OFF
ECHO This script will vet all packages in this project
ECHO Vetting main package
go vet rloop/Groundstation-v2-Backend-Fork/ 2> vet_results.txt
CALL :CheckError
ECHO Vetting constants package
go vet rloop/Groundstation-v2-Backend-Fork/constants 2>> vet_results.txt
CALL :CheckError
ECHO Vetting datastore package
go vet rloop/Groundstation-v2-Backend-Fork/datastore 2>> vet_results.txt
CALL :CheckError
ECHO Vetting gsgrpc package
go vet rloop/Groundstation-v2-Backend-Fork/gsgrpc 2>> vet_results.txt
CALL :CheckError
ECHO Vetting gstypes package
go vet rloop/Groundstation-v2-Backend-Fork/gstypes 2>> vet_results.txt
CALL :CheckError
ECHO Vetting helpers package
go vet rloop/Groundstation-v2-Backend-Fork/helpers 2>> vet_results.txt
CALL :CheckError
ECHO Vetting logging package
go vet rloop/Groundstation-v2-Backend-Fork/logging 2>> vet_results.txt
CALL :CheckError
ECHO Vetting parsing package
go vet rloop/Groundstation-v2-Backend-Fork/parsing 2>> vet_results.txt
CALL :CheckError
ECHO Vetting server package
go vet rloop/Groundstation-v2-Backend-Fork/server 2>> vet_results.txt
CALL :CheckError

EXIT /B %ERRORLEVEL%

:CheckError
if %errorlevel% equ 0 ( echo No warnings found ) else ( echo warnings found and written to file )