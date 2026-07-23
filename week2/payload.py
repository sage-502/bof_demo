# payload.py
import sys

offset = 0        # TODO: 채우기
overwrite = b""   # TODO: target 함수 주소 (little endian)

payload = b"A" * offset + overwrite
sys.stdout.buffer.write(payload)
