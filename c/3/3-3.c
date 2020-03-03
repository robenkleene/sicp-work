#include <ctype.h>
#include <stdio.h>
#include <string.h>

int issupported(char c1, char c2) {
    return (isdigit(c1) && isdigit(c2)) ||
        (isupper(c1) && isupper(c2)) ||
        (islower(c1) && islower(c2));
}

void expand(char s1[], char s2[]) {
    char c1;
    int length = strlen(s1);
    for (int i = 0; i < length; i++) {
        c1 = s1[i];
        if (i + 2 < length) {
            char c2 = s1[i + 2];
            if (s1[i + 1] == '-' &&
                issupported(c1, c2) &&
                c1 < c2) {
                i += 2;
                for (int j = c1; j <= c2; j++) {
                    // TODO: Replace s2, instead of `putchar`
                    putchar(j);
                }
            } else {
                putchar(c1);
            }
        } else {
            putchar(c1);
        }
    }
}

int main() {
    char s1[] = "Write a function expand(s1,s2) that expands z-a shorthand"
                " notations like a-z in the string s1 into the equivalent complete list"
                " abc...xyz in s2. Allow for letters of either case and digits, and be"
                " prepared to handle cases like a-b-c and a-z0−9 and -a-z. Arrange that"
                " a leading or trailing - is taken literally-.a-";
    char s2[0];
    printf("s1 = %s\n\n", s1);
    expand(s1, s2);
}
