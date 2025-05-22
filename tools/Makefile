arch := $(shell uname)
cpu  := $(shell uname -m)

all: quasi

quasi: Quasi Quasi/_bin/$(arch)-$(cpu)/quasi

Quasi:
	git clone https://github.com/crossadaptive/Quasi.git

Quasi/_bin/$(arch)-$(cpu)/quasi:
	make -C Quasi

clean:
	rm -r Quasi
