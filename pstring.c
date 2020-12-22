#include "pstring.h"


char pstrlen(Pstring* pstr){
    return pstr->len;
}

Pstring* replaceChar(Pstring* pstr, char oldChar, char newChar){
    for(int i=0; i < pstr->len; ++i){
        if(pstr->str[i] == oldChar){
            pstr->str[i] = newChar;
        }
    }
    return pstr;
}

Pstring* pstrijcpy(Pstring* dst, Pstring* src, char i, char j){

}

Pstring* swapCase(Pstring* pstr){
    char diff = 'a' - 'A';
    for(int i=0; i < pstr->len; ++i){
        if(pstr->str[i] <= 'Z' && pstr->str[i] >= 'A'){
            pstr->str[i] += diff;
        }
        if(pstr->str[i] <= 'z' && pstr->str[i] >= 'a'){
            pstr->str[i] -= diff;
        }
    }
    return pstr;
}

int pstrijcmp(Pstring* pstr1, Pstring* psrt2, char i, char j);
