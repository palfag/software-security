#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>



int main(){
    printf("uid=%d, euid=%d\n", getuid(), geteuid());
}
