# BOF ret2win Demo Environment

mitigation이 없는 간단한 32bit BOF+ret2win 실습 환경.

* [pwnable-intro](https://github.com/sage-502/pwnable-intro)의 시연용 보조자료로 제작됨.
* YB가 따라하기 쉽도록 `setup.sh` 실행만 하면 끝.
* Ubuntu 24.04에서 테스트함.

---

## 기능

* 32bit 환경 추가
* 패키지 설치 : libc6:i386, gcc-multlib, gdb-multlib
* 실습 환경 세팅

#### 환경 세팅 과정

1. `/tmp`에 실습 디렉터리 생성
2. 디렉터리에 소스코드 복사 : `bof.c`
3. 빌드 : `bof`
4. flag 생성
5. 최소 권한 사용자 생성 : baby
6. 권한 설정

## 설치 방법

```bash
git clone https://github.com/sage-502/bof_demo
cd bof_demo
bash setup.sh
```

## 사용
``` bash
su baby
cd /tmp/bof_example
# 분석
( python3 -c 'import sys; sys.stdout.buffer.write(b"A"*<offset> + b"<target addr>")'; cat ) | ./bof
```
