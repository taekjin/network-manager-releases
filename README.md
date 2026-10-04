# 🚀 Network Manager Releases

Binary releases and installers for Network Manager All-In-One suite (`Network Manager`, `RDP Gate`, `rdp-exit-node`).

---

## 🌐 회사 원격 PC `rdp-exit-node` 원클릭 설치 및 실행 가이드

사내 방화벽이 외부 포트를 차단하고 **3389(RDP) 단일 포트**만 허용할 때, 회사 원격 PC를 인터넷/사내망 출구(Exit Node)로 동작시키는 전용 데몬입니다.

### 🐧 1. 사내 원격 PC가 WSL (Linux)인 경우 (권장)
WSL 터미널에서 아래 명령어를 복사하여 실행합니다:
```bash
# 최신 rdp-exit-node 다운로드 및 실행 권한 부여
curl -fsSL https://github.com/taekjin/network-manager-releases/releases/latest/download/rdp-exit-node-linux-amd64 -o rdp-exit-node && chmod +x rdp-exit-node

# systemd 백그라운드 서비스 등록 및 즉시 시작
sudo ./rdp-exit-node -service install && sudo ./rdp-exit-node -service start
```

* **서비스 상태 확인**: `sudo ./rdp-exit-node -service status`
* **서비스 중지**: `sudo ./rdp-exit-node -service stop`
* **서비스 삭제**: `sudo ./rdp-exit-node -service uninstall`

---

### 🪟 2. 사내 원격 PC가 Windows인 경우 (PowerShell 관리자 권한)
Windows PowerShell을 **관리자 권한**으로 열고 아래 명령어를 실행합니다:
```powershell
# 최신 rdp-exit-node.exe 다운로드
Invoke-WebRequest -Uri "https://github.com/taekjin/network-manager-releases/releases/latest/download/rdp-exit-node.exe" -OutFile "rdp-exit-node.exe"

# Windows 백그라운드 서비스 등록 및 즉시 시작
.\rdp-exit-node.exe -service install
.\rdp-exit-node.exe -service start
```

* **서비스 상태 확인**: `.\rdp-exit-node.exe -service status`
* **서비스 중지**: `.\rdp-exit-node.exe -service stop`
* **서비스 삭제**: `.\rdp-exit-node.exe -service uninstall`

---

## 📦 클라이언트 설치 파일 목록

| 플랫폼 | 파일명 | 설명 |
| :--- | :--- | :--- |
| **macOS** | `Network-Manager-macOS.dmg` | 드래그 앤 드롭 설치 이미지 |
| **macOS** | `Network-Manager-macOS.pkg` | macOS 표준 설치 패키지 |
| **Windows** | `Network-Manager-Windows-Setup.msi` | Windows Installer 패키지 |
| **Windows** | `Network-Manager-Windows-x64.zip` | 무설치 포터블 압축 파일 |
| **Linux** | `network-manager_1.0.0_amd64.deb` | Ubuntu / Debian 전용 deb 패키지 |
| **Linux** | `Network-Manager-Linux-x64.tar.gz` | Linux 압축 아카이브 |
| **Exit Node (WSL)** | `rdp-exit-node-linux-amd64` | WSL/Linux amd64 단독 바이너리 |
| **Exit Node (Win)** | `rdp-exit-node.exe` | Windows amd64 단독 서비스 바이너리 |
