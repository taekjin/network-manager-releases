# ==========================================================
# 🛡️ Network Manager Windows One-Line Installer
# ==========================================================

$ErrorActionPreference = "Stop"
$Repo = "taekjin/network-manager-releases"
$DownloadUrl = "https://github.com/$Repo/releases/latest/download/Network-Manager-Windows-Setup.msi"
$TempMsi = "$env:TEMP\Network-Manager-Windows-Setup.msi"

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "   🛡️ Network Manager Windows Installer" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan

Write-Host "⬇️ 최신 Network Manager Windows 설치 마법사 다운로드 중..." -ForegroundColor Yellow
Invoke-WebRequest -Uri $DownloadUrl -OutFile $TempMsi

Write-Host "🚀 Network Manager 무인 자동 설치 진행 중..." -ForegroundColor Yellow
$proc = Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$TempMsi`" /quiet /norestart" -Wait -PassThru

Remove-Item -Path $TempMsi -Force -ErrorAction SilentlyContinue

if ($proc.ExitCode -eq 0 -or $proc.ExitCode -eq 3010) {
    Write-Host "==============================================" -ForegroundColor Green
    Write-Host "🎉 설치가 성공적으로 완료되었습니다!" -ForegroundColor Green
    Write-Host "   시작 메뉴 또는 바탕화면의 'Network Manager'를 실행하세요." -ForegroundColor White
    Write-Host "==============================================" -ForegroundColor Green
} else {
    Write-Host "❌ 설치 중 오류가 발생했습니다 (종료 코드: $($proc.ExitCode))." -ForegroundColor Red
}
