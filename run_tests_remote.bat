@echo off
REM Script para ejecutar tests en servidor remoto: 10.28.106.250
REM Requiere: PuTTY tools (plink, pscp) en el PATH

setlocal enabledelayedexpansion

echo ================================
echo Ejecutando Tests en Servidor
echo IP: 10.28.106.250
echo Usuario: patrimonio
echo ================================
echo.

set REMOTE_HOST=10.28.106.250
set REMOTE_USER=patrimonio
set REMOTE_PASSWORD=T1C050p06769077
set REMOTE_PATH=/home/patrimonio/control_patrimonial
set LOCAL_TESTS=E:\PROYECTOS WEB\control_patrimonial_web\tests

REM 1. Verificar conexion
echo 1. Verificando conexion al servidor...
plink -pw %REMOTE_PASSWORD% -l %REMOTE_USER% %REMOTE_HOST% "cd %REMOTE_PATH% && pwd"
if errorlevel 1 (
    echo ERROR: No se pudo conectar al servidor
    exit /b 1
)
echo. Conexion verificada
echo.

REM 2. Sincronizar tests
echo 2. Sincronizando tests...
pscp -pw %REMOTE_PASSWORD% -r "%LOCAL_TESTS%\test_auth.py" %REMOTE_USER%@%REMOTE_HOST%:%REMOTE_PATH%/tests/
pscp -pw %REMOTE_PASSWORD% -r "%LOCAL_TESTS%\test_api.py" %REMOTE_USER%@%REMOTE_HOST%:%REMOTE_PATH%/tests/
pscp -pw %REMOTE_PASSWORD% -r "%LOCAL_TESTS%\test_import_export.py" %REMOTE_USER%@%REMOTE_HOST%:%REMOTE_PATH%/tests/
pscp -pw %REMOTE_PASSWORD% -r "%LOCAL_TESTS%\conftest.py" %REMOTE_USER%@%REMOTE_HOST%:%REMOTE_PATH%/tests/
echo. Tests sincronizados
echo.

REM 3. Ejecutar tests
echo 3. Ejecutando tests...
plink -pw %REMOTE_PASSWORD% -l %REMOTE_USER% %REMOTE_HOST% "cd %REMOTE_PATH% && source venv/bin/activate && python -m pytest tests/test_auth.py tests/test_api.py tests/test_import_export.py -v --tb=short"

REM 4. Generar reporte de cobertura
echo.
echo 4. Generando reporte de cobertura...
plink -pw %REMOTE_PASSWORD% -l %REMOTE_USER% %REMOTE_HOST% "cd %REMOTE_PATH% && source venv/bin/activate && python -m pytest tests/test_auth.py tests/test_api.py tests/test_import_export.py --cov=app --cov-report=term-missing"

echo.
echo ================================
echo. Pruebas completadas
echo ================================
pause
