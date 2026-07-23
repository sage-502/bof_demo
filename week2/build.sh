#!/bin/bash
set -e

BINARY=bof
SRC=bof.c
FLAG_FILE=./flag

echo "[*] 1. 보호기법 끄고 컴파일"
gcc -g -m32 -fno-stack-protector -no-pie -z execstack -o "$BINARY" "$SRC"
echo "[+] 컴파일 완료: $BINARY"

echo "[*] 2. 바이너리 권한 설정 (setuid root)"
sudo chown root:root "$BINARY"
sudo chmod 6755 "$BINARY"
echo "[+] 권한 설정 완료 ($(ls -l $BINARY))"

echo "[*] 3. 루트 소유 flag 파일 생성"
sudo bash -c "echo 'congrats! you got the shell' > $FLAG_FILE"
sudo chown root:root "$FLAG_FILE"
sudo chmod 660 "$FLAG_FILE"
echo "[+] flag 파일 생성 완료 ($(ls -l $FLAG_FILE))"

echo "[+] setup complete"
