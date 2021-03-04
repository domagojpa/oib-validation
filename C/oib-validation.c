#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int oib_ok (const char *oib);

int main(int C, char *V[]) {
  if (C < 2 || strlen(V[1]) != 11) {
    fprintf(stderr, "Usage: %s OIB -- where OIB is 11 digits long Croatian Tax ID Number\n", V[0]);
    exit(1);
  }
  printf("%s => %d\n", V[1], oib_ok(V[1]));
  return 0;
}

/* OIB validation check */
/* return 0 as FALSE | 1 as TRUE | -1 as ERROR */
int oib_ok (const char *oib) {
  unsigned int i, a, k;
  if (! oib || ! oib[0]) return -1;
  a = 10;
  for (i = 0; i < 10; i++) {
    if (oib[i] < '0' || oib[i] > '9') return -1;
    a = (a + oib[i] - '0') % 10;
    if (! a) a = 10;
    a <<= 1; a %= 11;
  }
  k = 11 - a; if (10 == k) k = 0;
  k = '0' + k;
  if (oib[10] < '0' || oib[10] > '9') return -1;
  return (oib[10] == k) ? 1 : 0;
}

/* author: http://qwp.me/dd */
