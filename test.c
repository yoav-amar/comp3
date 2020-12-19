#include<stdio.h>
#include "func_select.h"

void aa(){
    printf("aa\n");
}
void bb(){
    printf("bb\n");
}
void cc(){
    printf("cc\n");
}
void dd(){
    printf("dd\n");
}
void ee(){
    printf("ee\n");
}
void ff(){
    printf("ff\n");
}

void main(){
    printf("kk\n");
    int x;
    scanf("%d", &x);
    select(x);
    printf("kk\n");

}