#include <stdio.h>
#include <stdlib.h>
#define FOR(variable,a,b) for(variable=(a);variable<(b);variable++)

// sort method
int int_sort(const void* a, const void* b) {
    // to cast variable from void
    // now
    if(*(int* )a < *(int* )b) {
        return -1;
    } else {
        if(*(int* )a == *(int* )b) {
             return 0;
        }
    }
  return 1;
}

void intsort(int* target, int count) {
    qsort((void* )target, count, sizeof(target[0]), int_sort);
    return;
}

void reverse(int* target, int count) {
    int i;
    int swap;
    FOR(i, 0, count/2) {
        swap = target[i];
        target[i] = target[(count-1)-i];
        target[count-i] = swap;
    }
    return;
}

int main() {
    // difine phase
    int i;
    int hight[10];

    // import phase
    FOR(i, 0, 10) {
        scanf("%d", &hight[i]);
    }

    // culculate phase
    intsort(hight, 10);
    reverse(hight, 10);
    FOR(i, 0, 3) {
    
    // output phase
        printf("%d\n", hight[i]);
    }

    return 0;
}