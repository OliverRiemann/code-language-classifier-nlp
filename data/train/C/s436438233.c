#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DBG 0
#define BUFSIZE 40

static short h[6];

// return 0 : EOF
//        1 : read success
int getSimEq() {
  char buf[BUFSIZE] = {0};
  char *p;
  int i, j;
  if (NULL == fgets(buf, BUFSIZE, stdin)) {
    if (DBG) {
      fprintf (stderr, "EOF\n");
    }
    return 0;
  }
  buf[strlen(buf)-1] = 0;
  if (DBG) {
    fprintf(stderr, "input=%s\n", buf);
  }
  for (i=0, j=0, p = buf; j<6; j++, p = p+strlen(p)+1) {
    for (; buf[i] != ' ' && i<BUFSIZE; i++);
    buf[i] = 0;
    h[j] = atoi(p);
  }
  if (DBG) {
    fprintf(stderr, "h[*] =%d %d %d %d %d %d\n", h[0], h[1], h[2], h[3], h[4], h[5]);
  }
  return 1;
}

int main (void) {
  float x, y, detr;
  while (getSimEq()) {
    // (h[0], h[1]) (x) = (h[2])
    // (h[3], h[4]) (y)   (h[5])
    // (x) = 1/(h[0]*h[4]-h[1]*h[3]) (h[4], -h[1]) (h[2])
    // (y)                           (-h[3], h[0]) (h[5])
    // (x) = 1/(h[0]*h[4]-h[1]*h[3]) * ( h[4]*h[2] - h[1]*h[5])
    // (y) = 1/(h[0]*h[4]-h[1]*h[3]) * (-h[3]*h[2] + h[0]*h[5])
    detr = 1.0/(h[0]*h[4]-h[1]*h[3]);
    x = detr * ( h[4]*h[2] - h[1]*h[5]);
    y = detr * (-h[3]*h[2] + h[0]*h[5]);
    // for negative 0
    if (x == 0) x = 0;
    if (y == 0) y = 0;
    printf ("%.3f %.3f\n", x, y);
    if (DBG) {
      fprintf (stderr, "%f %f\n", x, y);
    }
  }
  return 0;
}