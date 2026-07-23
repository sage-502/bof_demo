/* 
컴파일 옵션: gcc -g -m32 -fno-stack-protector -no-pie -z execstack -o stack stack.c
ASLR 끄기:  echo 0 | sudo tee /proc/sys/kernel/randomize_va_space
*/
// stack.c
#include <stdio.h>

int add(int a, int b) {
    int result;
    result = a + b;
    return result;
}

int main() {
    int x = 3;
    int y = 5;
    int sum;

    sum = add(x, y);
    printf("sum = %d\n", sum);

    return 0;
}
