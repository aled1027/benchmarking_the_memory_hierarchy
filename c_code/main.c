#include <stdio.h>
#include <assert.h>

int main(int argc, char *argv[]) 
{
    assert(argc);
    assert(argv);

    printf("running\n");
    return 0;
}
