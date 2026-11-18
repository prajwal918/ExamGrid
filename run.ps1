# ExamGrid PowerShell Launcher
Set-Location -LiteralPath $PSScriptRoot

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "          Launching ExamGrid Spring Boot App" -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

# Check Docker
$dockerRunning = $false
try {
    $null = docker ps 2>&1
    if ($LASTEXITCODE -eq 0) { $dockerRunning = $true }
} catch {}

if ($dockerRunning) {
    Write-Host "[OK] Docker detected. Checking MySQL container..." -ForegroundColor Green
    $null = docker start examgrid-mysql 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Starting new MySQL container on port 3306..." -ForegroundColor Yellow
        docker run -d --name examgrid-mysql -p 3306:3306 -e MYSQL_DATABASE=examgrid_db -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_ROOT_PASSWORD=root mysql:8.0 | Out-Null
        Write-Host "Waiting 8 seconds for MySQL to initialize..." -ForegroundColor Yellow
        Start-Sleep -Seconds 8
    }
    Write-Host "[OK] MySQL container is active!" -ForegroundColor Green
} else {
    Write-Host "[INFO] Docker not detected. Connecting to local MySQL service on localhost:3306..." -ForegroundColor Yellow
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
