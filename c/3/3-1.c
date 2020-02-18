#include <stdio.h>

#define LENGTH 3

int binsearch(int x, int v[], int n) {
    int low, high, mid;

    low = 0;
    high = n - 1;
    while (low <= high) {
        mid = (low + high) / 2;
        if (x < v[mid])
            high = mid - 1;
        else if (x > v[mid])
            low = mid + 1;
        else /* found match */
            return mid;
    }
    return -1; /* no match */
}

int main() {
    int v[LENGTH] = {1, 2, 3};
    int x = 2;
    int result = binsearch(x, v, LENGTH);
    printf("result = %i\n", result);
}
