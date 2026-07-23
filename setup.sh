#!/bin/bash
set -e

echo "[*] pwn-intro-prac setup start"

# ---------------------------
# 1. 기본 패키지 설치
# ---------------------------
echo "[*] 기본 패키지 설치 시작"
apt update
apt install -y \
    gcc gdb make \
    python3 python3-pip \
    git vim \
    checksec \
    file
echo "[+] 기본 패키지 설치 완료"

# ---------------------------
# 2. 32bit 환경 지원
# ---------------------------
echo "[*] 32bit 환경 구성"
dpkg --add-architecture i386
apt update
apt install -y \
    libc6:i386 \
    libc6-dbg:i386 \
    gcc-multilib
echo "[+] 32bit 환경 구성 완료"

# ---------------------------
# 3. pwntools
# ---------------------------
echo "[*] pwntools 설치 시작"
pip3 install --upgrade pwntools
echo "[+] pwntools 설치 완료"

# ---------------------------
# 4. 32bit 컴파일 확인
# ---------------------------
echo "[*] 32bit 컴파일 테스트"
echo 'int main(){return 0;}' > /tmp/test32.c
gcc -m32 /tmp/test32.c -o /tmp/test32 && echo "[+] 32bit 컴파일 성공" || echo "[-] 32bit 컴파일 실패"
rm -f /tmp/test32.c /tmp/test32

echo "[+] setup complete"
