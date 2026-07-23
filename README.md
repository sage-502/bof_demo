# 실습 자료

## 구성

```
pwn-intro-prac
├── LICENSE
├── README.md
├── setup.sh
├── week1
│   └── stack.c
└── week2
    ├── bof.c
    └── build.sh
```

## 시작하기

```bash
git clone https://github.com/sage-502/pwn-intro-prac
cd pwn-intro-prac
sudo bash setup.sh
```

`setup.sh`는 실습에 필요한 gcc, gdb, pwntools 등 툴을 한 번에 설치함.

---

## week1: 스택 프레임 실습

```bash
cd week1
gcc -g -m32 -fno-stack-protector -no-pie -z execstack -o stack stack.c
gdb ./stack
```

컴파일 옵션은 `stack.c` 파일 상단 주석에도 적혀있음

---

## week2: Buffer Overflow (ret2win)

```bash
cd week2
bash build.sh
./bof
```
> `build.sh`는 취약한 바이너리를 컴파일하고, setuid/setgid 권한을 설정하고, `flag` 파일을 생성함.
> `flag` 파일은 익스플로잇에 성공해야 읽을 수 있음 (직접 `cat flag`로는 안 열림)

### Exploit 작성

`payload.py`에서 `offset`, `overwrite` 값을 직접 채워서 익스플로잇 payload를 완성하기.

디버깅은 이렇게:
```bash
python3 payload.py > payload.bin
xxd payload.bin
gdb ./bof
(gdb) run < payload.bin
```
