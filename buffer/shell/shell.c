#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(){
    char* args[2];
    args[0]="/bin/bash";
    args[1]=NULL;
    execve(args[0],args,NULL);
    exit(0);
}
