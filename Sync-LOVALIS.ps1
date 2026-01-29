# Sync-LOVALIS.ps1
Set-Location $PSScriptRoot
git add .
git commit -m "Auto-Sync: $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
git push origin main
Write-Host "LOVALIS erfolgreich synchronisiert!" -ForegroundColor Green
Start-Sleep -Seconds 2