#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
using namespace std;
#define MAX_LEN 100000
int n;
char s[MAX_LEN+2];
int a[2*MAX_LEN+4];
int main()
{
  int j, l;
  int p;
  s[0] = 1;
  scanf("%s", &s[1]);
  n = strlen(&s[1]);
  j = 1;
  l = 1;
  a[0] = 1;
  a[1] = 0;
  for (int k=2; k<=n+1; k++) {
    for (;;) {
      if (s[k] == s[k-l-1]) {
        l += 2;
        goto advance;
      }
      a[++j] = l;
      for (p=j-1; --l>=0&&l!=a[p]; p--) {
        a[++j] = min(a[p], l);
      }
      if (l < 0) {
        l = 1;
        goto advance;
      }
    }
    advance:
    ;
  }
  for (int k=1; k<=2*n+1; k++) {
    printf("%d\n", a[k]);
  }
  return 0;
}
