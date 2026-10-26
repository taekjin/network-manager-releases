#!/bin/bash
set -e

# ==========================================================
# 🛡️ Network Manager All-In-One One-Line Installer
# Supports macOS (GUI App) and Linux (Daemon & CLI)
# ==========================================================

REPO="taekjin/network-manager-releases"
LATEST_URL="https://github.com/${REPO}/releases/latest/download"

OS="$(uname -s)"
ARCH="$(uname -m)"

echo "=============================================="
echo "   🛡️ Network Manager One-Line Installer"
echo "=============================================="

case "$OS" in
  Darwin*)
    echo "🍏 macOS 환경이 감지되었습니다."
    echo "⬇️ 최신 Network Manager macOS 설치 이미지를 다운로드하는 중..."
    
    TMP_DMG="/tmp/Network-Manager-macOS.dmg"
    MOUNT_DIR="/tmp/netmanager_mount_$$"
    
    rm -f "$TMP_DMG"
    curl -fsSL "${LATEST_URL}/Network-Manager-macOS.dmg" -o "$TMP_DMG"
    
    echo "📦 설치 이미지 마운트 중..."
    mkdir -p "$MOUNT_DIR"
    hdiutil attach "$TMP_DMG" -mountpoint "$MOUNT_DIR" -nobrowse -quiet
    
    echo "🚀 /Applications 폴더로 Network Manager.app 설치 중..."
    # 기존 실행 중인 프로세스 안전 종료 및 복사
    pkill -f "Network Manager.app" 2>/dev/null || true
    rm -rf "/Applications/Network Manager.app"
    cp -R "${MOUNT_DIR}/Network Manager.app" /Applications/
    
    # 마운트 해제 및 임시 파일 정리
    hdiutil detach "$MOUNT_DIR" -quiet || true
    rm -rf "$MOUNT_DIR" "$TMP_DMG"
    
    # 격리 속성(Gatekeeper) 제거
    xattr -cr "/Applications/Network Manager.app" 2>/dev/null || true
    
    echo "=============================================="
    echo "🎉 설치가 성공적으로 완료되었습니다!"
    echo "   • 실행 위치: /Applications/Network Manager.app"
    echo "   • 지금 앱을 실행하려면: open '/Applications/Network Manager.app'"
    echo "=============================================="
    ;;

  Linux*)
    echo "🐧 Linux 환경이 감지되었습니다."
    
    if [ "$EUID" -ne 0 ]; then
      echo "❌ Linux 환경에서 데몬 설치를 위해 루트 권한(sudo)이 필요합니다."
      echo "   실행 명령: curl -fsSL https://raw.githubusercontent.com/${REPO}/main/install.sh | sudo bash"
      exit 1
    fi

    # Ubuntu / Debian deb 설치 우선 시도
    if which dpkg > /dev/null 2>&1; then
      echo "⬇️ Ubuntu/Debian (.deb) 패키지 다운로드 및 설치 중..."
      TMP_DEB="/tmp/network-manager.deb"
      curl -fsSL "${LATEST_URL}/network-manager_1.0.0_amd64.deb" -o "$TMP_DEB"
      dpkg -i "$TMP_DEB" || apt-get install -f -y
      rm -f "$TMP_DEB"
    else
      # 일반 Linux tar.gz 설치
      echo "⬇️ Linux (.tar.gz) 아카이브 다운로드 및 설치 중..."
      TMP_TGZ="/tmp/network-manager.tar.gz"
      TMP_DIR="/tmp/netmanager_extract_$$"
      curl -fsSL "${LATEST_URL}/Network-Manager-Linux-x64.tar.gz" -o "$TMP_TGZ"
      mkdir -p "$TMP_DIR"
      tar -xzf "$TMP_TGZ" -C "$TMP_DIR"
      cd "$TMP_DIR"
      ./install.sh
      cd /
      rm -rf "$TMP_DIR" "$TMP_TGZ"
    fi

    echo "=============================================="
    echo "🎉 Linux 데몬 및 서비스 등록이 완료되었습니다!"
    echo "   • 서비스 상태 확인: systemctl status network-manager"
    echo "   • 웹 대시보드: http://localhost:9000"
    echo "=============================================="
    ;;

  *)
    echo "❌ 지원하지 않는 운영체제입니다: $OS"
    echo "   Windows 환경에서는 PowerShell에서 아래 명령을 실행하세요:"
    echo "   irm https://raw.githubusercontent.com/${REPO}/main/install.ps1 | iex"
    exit 1
    ;;
esac
