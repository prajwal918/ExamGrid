# ExamGrid PowerShell Launcher
Set-Location -LiteralPath $PSScriptRoot

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "          Launching ExamGrid Spring Boot App" -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

# 1. Check Docker
$dockerRunning = $false
try {
    $null = docker ps 2>&1
    if ($LASTEXITCODE -eq 0) { $dockerRunning = $true }
} catch {}

if ($dockerRunning) {
    Write-Host "[OK] Docker detected. Ensuring MySQL container is running..." -ForegroundColor Green
    $null = docker start examgrid-mysql 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Starting new MySQL container on port 3306..." -ForegroundColor Yellow
        docker run -d --name examgrid-mysql -p 3306:3306 -e MYSQL_DATABASE=examgrid_db -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_ROOT_PASSWORD=root mysql:8.0 | Out-Null
    }
} else {
    Write-Host "[INFO] Docker not detected. Connecting to local MySQL service on localhost:3306..." -ForegroundColor Yellow
}

# 2. Wait for MySQL port 3306 to accept connections
Write-Host "Waiting for MySQL on port 3306..." -NoNewline
$connected = $false
for ($i = 0; $i -lt 25; $i++) {
    $tcp = Test-NetConnection -ComputerName 127.0.0.1 -Port 3306 -WarningAction SilentlyContinue
    if ($tcp.TcpTestSucceeded) {
        $connected = $true
        break
    }
    Write-Host "." -NoNewline
    Start-Sleep -Seconds 1
}
Write-Host ""

if (-not $connected) {
    Write-Host "[ERROR] Could not connect to MySQL on port 3306." -ForegroundColor Red
    Write-Host "Please start Docker Desktop or ensure MySQL service is running." -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "[OK] MySQL is active and ready!" -ForegroundColor Green

# 3. Check for pre-built JAR
if (-not (Test-Path "target\examgrid-1.0.0.jar")) {
    Write-Host "[INFO] Building application JAR via Maven Wrapper..." -ForegroundColor Cyan
    .\mvnw.cmd package -DskipTests
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[ERROR] Build failed." -ForegroundColor Red
        exit 1
    }
}

Write-Host ""
Write-Host "Starting Spring Boot Server..." -ForegroundColor Cyan
Write-Host "--------------------------------------------------------"
Write-Host "Website URL : http://localhost:8080" -ForegroundColor Green
Write-Host "Admin Login : http://localhost:8080/login (ADMIN / admin123)" -ForegroundColor Green
Write-Host "Seat Lookup : http://localhost:8080/seat-lookup" -ForegroundColor Green
Write-Host "To STOP     : Press Ctrl+C in this terminal" -ForegroundColor Yellow
Write-Host "--------------------------------------------------------"
Write-Host ""

java "-Dspring.jpa.properties.hibernate.globally_quoted_identifiers=true" -jar target\examgrid-1.0.0.jar
