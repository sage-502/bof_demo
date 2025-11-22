#include<stdio.h>
#include<stdlib.h>

void target(){
    setregid(getegid(), getegid());
    system("/bin/sh");
}

void func(int value){
    char buf[20];
    printf("input: ");
    gets(buf);
    printf("value: %d\n", value);
    printf("buf: %s\n", buf);
}

int main(){
    int num = 5;
    func(num);
}
