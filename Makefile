TIME=/usr/bin/time -f '%es  %C'
SIZE=100000000

all:
	@echo "Run sequentially for 1M, 10M, 100M, 1G. Hit Ctl-C to exit."
	make -s bench SIZE=1000000
	make -s bench SIZE=10000000
	make -s bench SIZE=100000000
	make -s bench SIZE=1000000000

bench: base32_encode_cr base32_encode_c
	$(TIME) ./base32_encode_cr $(SIZE)
	$(TIME) ./base32_encode_c  $(SIZE)

base32_encode_cr: samples/base32_encode.cr src/base32.cr
	crystal build --release -o "$@" "$<"

base32_encode_c: samples/base32_encode.c
	gcc -O2 -o "$@" "$<"
