/*
  @file sort.c
  @brief sort functions implementation
*/

#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include "helpers.h"
#include "sort.h"
#include "player.h"

bool goes_before(player_t x, player_t y){
    bool r = true;
    if (x.rank > y.rank){
        r = false;
    }
    return r;
}

bool array_is_sorted(player_t atp[], unsigned int length) {
    unsigned int i = 1u;
    while (i < length && goes_before(atp[i - 1u], atp[i])) {
        i++;
    }
    return (i == length);
}

void swap(player_t a[], unsigned int j, unsigned int i){
  player_t tmp;
  tmp = a[j];
  a[j] = a[i];
  a[i] = tmp;
}

static unsigned int partition(player_t a[], unsigned int izq, unsigned int der) {
    unsigned int ppiv = izq;
    unsigned int i= izq+1;
    unsigned int j= der;
    
    while(i<=j){
        if(goes_before(a[ppiv],a[i]) && goes_before(a[j],a[ppiv])){
            swap(a,i,j);
            ++i;
            --j;
        }else{
            if(goes_before(a[i],a[ppiv])){
                ++i;
            }
            if(goes_before(a[ppiv],a[j])){
                --j;
            }
        }
    }
    swap(a,ppiv,j);
    return j;
}

static void quick_sort_rec(player_t a[], unsigned int izq, unsigned int der) {
    unsigned int ppiv = partition(a,izq,der);
    if(ppiv>izq) {
        quick_sort_rec(a, izq, ppiv-1);
    }
    if(ppiv<der) {
        quick_sort_rec(a, ppiv+1, der);
    }

}

void sort(player_t a[], unsigned int length) {
    quick_sort_rec(a, 0, (length == 0) ? 0 : length - 1);
}

