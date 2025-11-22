#!/bin/bash

echo "[*] BOF 시연 환경 설정 시작..."

# 1. 디렉토리 생성
TARGET_DIR="/tmp/bof_example"
echo "[*] 디렉토리 생성: $TARGET_DIR"
mkdir -p $TARGET_DIR
cd $TARGET_DIR || exit 1

# 2. 소스코드 복사
echo "[*] bof.c 복사..."
cp "$(dirname "$0")/bof.c" . || { echo "bof.c 복사 실패"; exit 1; }

# 3. 컴파일
echo "[*] 컴파일 중..."
gcc -m32 -fno-stack-protector -fno-pie -no-pie -fno-omit-frame-pointer \
    -Wno-deprecated-declarations -O0 -g -o bof bof.c || { echo "컴파일 실패"; exit 1; }

# 4. flag 생성
echo "[*] flag 생성..."
echo "flag{cat_overflow_exception^._.^}" > flag

# 5. baby 사용자 생성 (이미 있으면 skip)
if id "baby" &>/dev/null; then
    echo "[*] baby 계정 이미 존재 — 건너뜀"
else
    echo "[*] baby 계정 생성..."
    sudo adduser --disabled-password --gecos "" baby
fi

# 6. 권한 설정
echo "[*] 권한 설정 중..."
sudo chown root:root bof bof.c flag
sudo chmod 2755 bof
sudo chmod 644 bof.c
sudo chmod 640 flag

echo "[+] BOF 시연 환경 설정 완료!"
echo "[+] 다음 단계:"
echo "    su baby"
echo "    cd /tmp/bof_example"
echo "    ( python3 -c 'import sys; sys.stdout.buffer.write(b\"A\"*offset + b\"<addr>\")'; cat ) | ./bof"
