#include <stdio.h>
#include "pstring.h"
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
void main() {

	Pstring p1;
	Pstring p2;
	int len;
	int opt;
/*
	// initialize first pstring
	scanf("%d", &len);
	scanf("%s", p1.str);
	p1.len = len;


	// initialize second pstring
	scanf("%d", &len);
	scanf("%s", p2.str);
	p2.len = len;

	// select which function to run
	scanf("%d", &opt);
	run_func(opt, &p1, &p2);
*/
	p1.len = 3;
	p1.str[0] = '1';
	p1.str[1] = 'p';
	p1.str[2] = 'c';

	p2.len = 3;
	p2.str[0] = '1';
	p2.str[1] = 'd';
	p1.str[2] = 'c';
	int x = pstrijcmp(&p1, &p2, 0, 1);
	printf("str: %d\n", x);



}
