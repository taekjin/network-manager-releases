# 🚀 Network Manager Releases

모든 환경(Mac, Windows, Linux)을 지원하는 **Network Manager All-In-One 스위트**의 원클릭 설치 및 릴리즈 저장소입니다.

---

## ⚡ 1. 내 컴퓨터에 Network Manager 설치하기 (원클릭)

터미널이나 PowerShell에 복사하여 붙여넣으면, **최신 설치 파일을 다운로드하여 앱 설치까지 자동으로 완료**됩니다.

### 🍏 macOS (MacBook / Mac mini / iMac)
터미널(`Terminal.app`)을 열고 아래 한 줄을 실행합니다:
```bash
curl -fsSL https://raw.githubusercontent.com/taekjin/network-manager-releases/main/install.sh | bash
```
> 설치가 끝나면 `/Applications/Network Manager.app`에 즉시 등록됩니다.

### 🪟 Windows 10 / 11
Windows **PowerShell**을 열고 아래 한 줄을 실행합니다:
```powershell
irm https://raw.githubusercontent.com/taekjin/network-manager-releases/main/install.ps1 | iex
```
> 바탕화면 및 시작 메뉴에 무인 자동 설치됩니다.

### 🐧 Linux (Ubuntu / Debian)
터미널에서 아래 한 줄을 실행합니다:
```bash
curl -fsSL https://raw.githubusercontent.com/taekjin/network-manager-releases/main/install.sh | sudo bash
```
> systemd 백그라운드 서비스 및 데몬으로 자동 구성됩니다.

---

## 📦 2. 브라우저에서 직접 다운로드

수동으로 설치 파일을 다운로드하여 설치하고 싶으신 경우 아래 링크를 클릭하세요.

| 플랫폼 | 다운로드 직링크 | 형식 | 설명 |
| :--- | :--- | :--- | :--- |
| **macOS** | [Network-Manager-macOS.dmg](https://github.com/taekjin/network-manager-releases/releases/latest/download/Network-Manager-macOS.dmg) | `.dmg` | 드래그 앤 드롭 설치 이미지 |
| **macOS** | [Network-Manager-macOS.pkg](https://github.com/taekjin/network-manager-releases/releases/latest/download/Network-Manager-macOS.pkg) | `.pkg` | macOS 표준 설치 패키지 |
| **Windows** | [Network-Manager-Windows-Setup.msi](https://github.com/taekjin/network-manager-releases/releases/latest/download/Network-Manager-Windows-Setup.msi) | `.msi` | Windows 정식 설치 마법사 |
| **Windows** | [Network-Manager-Windows-x64.zip](https://github.com/taekjin/network-manager-releases/releases/latest/download/Network-Manager-Windows-x64.zip) | `.zip` | 무설치 포터블 압축 파일 |
| **Linux (Ubuntu)** | [network-manager_1.0.0_amd64.deb](https://github.com/taekjin/network-manager-releases/releases/latest/download/network-manager_1.0.0_amd64.deb) | `.deb` | Ubuntu / Debian 전용 패키지 |
| **Linux (기타)** | [Network-Manager-Linux-x64.tar.gz](https://github.com/taekjin/network-manager-releases/releases/latest/download/Network-Manager-Linux-x64.tar.gz) | `.tar.gz` | Linux 압축 아카이브 |

---

## 🌐 3. 회사 원격 PC `rdp-exit-node` 설치 가이드

사내 방화벽이 외부 포트를 차단하고 **3389(RDP) 단일 포트**만 허용할 때, 사내 원격 PC를 인터넷/사내망 출구(Exit Node)로 동작시키는 전용 데몬입니다.

### 🐧 사내 원격 PC가 Linux / WSL인 경우 (권장)
```bash
curl -fsSL https://github.com/taekjin/network-manager-releases/releases/latest/download/rdp-exit-node-linux-amd64 -o rdp-exit-node && chmod +x rdp-exit-node
sudo ./rdp-exit-node -service install && sudo ./rdp-exit-node -service start
```

### 🪟 사내 원격 PC가 Windows인 경우 (PowerShell 관리자 권한)
```powershell
Invoke-WebRequest -Uri "https://github.com/taekjin/network-manager-releases/releases/latest/download/rdp-exit-node.exe" -OutFile "rdp-exit-node.exe"
.\rdp-exit-node.exe -service install
.\rdp-exit-node.exe -service start
```
