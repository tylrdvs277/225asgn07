#include <stdio.h>

void countBackwardFrom(int x);

void countForwardTo(int x);

void countBackwardFrom(int x) {
    if (x == 1) {
        printf("1");
        return;
    } else if (x < 1) {
        return;
    } else {
        printf("%d, ", x);
        countBackwardFrom(x - 1);
    }
}

void countForwardTo(int x) {
    if (x == 1) {
        printf("1");
        return;
    } else if (x < 1) {
        return;
    } else {
        countForwardTo(x - 1);
        printf(", %d", x);
    }
}

int main() {
    char again = 'y';
    int number;
    while (again == 'y') {
        printf("Enter a number: ");
        scanf(" %d", &number);
        countBackwardFrom(number);
        printf("\n");
        countForwardTo(number);
        printf("\n\n");
        printf("Again? ");
        scanf(" %c", &again);
        printf("\n");
    }
    return 0;
}
