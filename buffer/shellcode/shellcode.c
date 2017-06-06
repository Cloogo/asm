#include <stdio.h>

char shellcode[16]="\x48\xc7\xc0\x3c\x00\x00\x00"
                 "\x48\xc7\xc7\x01\x00\x00\x00"
	         	 "\x0f\x05";

int main(){
    long long int* ret;
    ret=(long long int*)&ret+2;
    (*ret)=(long long int)shellcode;
}
