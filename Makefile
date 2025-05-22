
basever  := 0.9.2

arch     := $(shell uname)
cpu      := $(shell uname -m)
quasi    := tools/Quasi/_bin/$(arch)-$(cpu)/quasi
gendir   := _gen
libdir   := $(gendir)/sqlgen/_gen/_lib/$(arch)-$(cpu)
libbase  := $(libdir)/libbase.a
includes := -I$(gendir)/sqlgen/_gen/include -I$(gendir)/sqlgen/source/include
bindir   := _bin/$(arch)-$(cpu)
sqlgen   := $(bindir)/sqlgen

all: sqlgen

sqlgen: $(sqlgen)

$(sqlgen): csource $(bindir) $(libbase)
	gcc -g -o $(sqlgen) -lbase -L$(libdir) $(includes) _gen/sqlgen/source/c/*.c

csource: $(quasi) $(gendir)
	$(quasi) -f $(gendir)/sqlgen/_gen dep/libbase-$(basever).quasi.txt
	$(quasi) -f $(gendir)/sqlgen      source/mt/*.txt

$(libbase):
	make -C $(gendir)/sqlgen/_gen -f Makefile.mak

$(bindir):
	mkdir -p $(bindir)

$(gendir):
	mkdir -p $(gendir)/sqlgen/_gen

clean:
	rm -rf _bin _gen _lib _obj _sql

superclean: clean
	make -C tools clean












#
#   Tools
#

quasi: $(quasi)

$(quasi):
	make -C tools quasi
