@echo off
title ExamGrid Launcher
cd /d "%~dp0"

echo ========================================================
echo           Launching ExamGrid Spring Boot App
echo ========================================================
echo.

:: 1. Ensure MySQL is running
echo Checking MySQL database service...
docker ps >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Docker is running. Starting MySQL container...
    docker start examgrid-mysql >nul 2>&1
    if errorlevel 1 (
        echo Starting new MySQL container on port 3306...
        docker run -d --name examgrid-mysql -p 3306:3306 -e MYSQL_DATABASE=examgrid_db -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_ROOT_PASSWORD=root mysql:8.0 >nul 2>&1
    )
) else (
    echo [INFO] Docker not active. Connecting to local Windows MySQL on port 3306...
)

:: 2. Wait until MySQL port 3306 is actually ready to accept connections
echo Waiting for MySQL to be ready on port 3306...
powershell -NoProfile -Command "$ready = $false; for ($i=0; $i -lt 25; $i++) { if ((Test-NetConnection -ComputerName 127.0.0.1 -Port 3306 -WarningAction SilentlyContinue).TcpTestSucceeded) { $ready = $true; break }; Write-Host '.' -NoNewline; Start-Sleep -Seconds 1 }; Write-Host ''; if (-not $ready) { exit 1 } else { exit 0 }"

if errorlevel 1 (
    echo.
    echo [ERROR] MySQL is not responding on port 3306.
    echo Please make sure Docker Desktop is running or your local MySQL service is started.
    pause
    exit /b 1
)

echo [OK] MySQL is connected and accepting connections!
echo.

:: 3. Check for pre-built JAR
if not exist "target\examgrid-1.0.0.jar" (
    echo [INFO] Building application JAR via Maven Wrapper...
    call mvnw.cmd package -DskipTests
    if errorlevel 1 (
        echo [ERROR] Maven build failed.
        pause
        exit /b 1
    )
)

echo Starting Spring Boot Server...
echo --------------------------------------------------------
echo Website URL : http://localhost:8080
echo Admin Login : http://localhost:8080/login  (ADMIN / admin123)
echo Seat Lookup : http://localhost:8080/seat-lookup
echo To STOP     : Press Ctrl+C in this window
echo --------------------------------------------------------
echo.

java "-Dspring.jpa.properties.hibernate.globally_quoted_identifiers=true" -jar target\examgrid-1.0.0.jar

if errorlevel 1 (
    echo.
    echo [ERROR] Application stopped with an error.
    pause
)
