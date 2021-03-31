// This code is for testing and will reuse the allocated memory.

#include <stdio.h>
#include <stdlib.h>

static const char encode_map[32] = "0123456789ABCDEFGHJKMNPQRSTVWXYZ";

char *base32_encode(long number, char *out) {

  if (number == 0) {
    out[0] = '0';
    out[1] = 0;
    return out;
  }

  if (!out) {
    return NULL;
  }

  char *out_ptr = out + 13;
  *out_ptr = 0;
  while (number > 0) {
    int index = number % 32;
    number = number >> 5;
    *--out_ptr = encode_map[index];
  }
  return out_ptr;
}

int main(int argc, char *argv[]) {
  if (argc != 2) {
    printf("missing max number\n");
    exit(1);
  }

  char *err;
  long max = strtol(argv[1], &err, 10);
  if (*err != '\0') {
    printf("invalid i64 [%s]\n", argv[1]);
  }

  char *buffer = malloc(14);
  for (long number = 0; number <= max; number++ ){
    char *out = base32_encode(number, buffer);
    if (out == NULL) {
      printf("can't allocate memory. number=[%ld]\n", number);
      exit(2);
    }
  }
}
