# BOF ret2win Demo Environment

간단한 ret2win / buffer overflow 실습 환경.

`setup.sh` 실행만으로 시연용 환경이 자동으로 세팅됩니다.

##  설치 방법

```bash
git clone https://github.com/sage-502/bof_demo
cd bof_demo
bash setup.sh
```

## 사용
```
su baby
cd /tmp/bof_example
( python3 -c 'import sys; sys.stdout.buffer.write(b"A"*<offset> + b"<target addr>")'; cat ) | ./bof
```
