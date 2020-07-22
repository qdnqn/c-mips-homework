#include <stdio.h>

int compare(int a, int b){
  if(a == b)
    return 1;
  
  return 0;
}

int max(int *niz, int size){
  if(size == 1){
    return *niz;
  }

  int rec = max(niz+1, size-1);

  if(compare(*niz, rec)) return *niz;
  return rec;
}

int main(){
  int niz[9] = {1,2,3,4,5,6,7,8,9};
  int m = max(niz, 9);
  
  printf("Max: %d\n", m);

  return 0;
}
