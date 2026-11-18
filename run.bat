@echo off
title ExamGrid Launcher
cd /d "%~dp0"

echo ========================================================
echo           Launching ExamGrid Spring Boot App
echo ========================================================
echo.

:: Check if Docker is available
docker ps >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Docker detected. Ensuring MySQL container is running...
    docker start examgrid-mysql >nul 2>&1
    if errorlevel 1 (
        echo Starting new MySQL container on port 3306...
        docker run -d --name examgrid-mysql -p 3306:3306 -e MYSQL_DATABASE=examgrid_db -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_ROOT_PASSWORD=root mysql:8.0 >nul 2>&1
        echo Waiting 8 seconds for MySQL to initialize...
        timeout /t 8 /nobreak >nul
    )
    echo [OK] MySQL is active!
) else (
    echo [INFO] Docker not detected. Connecting to local MySQL service on localhost:3306...
)

echo.
echo Starting Spring Boot Server...
echo --------------------------------------------------------
echo The web app will open at: http://localhost:8080
echo To STOP the server, press Ctrl+C in this window.
echo --------------------------------------------------------
echo.

java "-Dspring.jpa.properties.hibernate.globally_quoted_identifiers=true" -jar target\examgrid-1.0.0.jar

if errorlevel 1 (
    echo.
    echo [ERROR] Application failed to start.
    echo Please make sure Java 17/21 is installed and MySQL is running on port 3306.
    pause
)
