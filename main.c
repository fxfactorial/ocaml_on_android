#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>
#include <string.h>

#include <caml/callback.h>

int main (int argc, char **argv)
{
  caml_startup(argv);
  return 0;
}
