CC = gcc
CFLAGS = -g -Wall
LDFLAGS = -lpthread

all: proxy

csapp.o: csapp.c csapp.h
	$(CC) $(CFLAGS) -c csapp.c

proxy.o: proxy.c csapp.h pcache.h
	$(CC) $(CFLAGS) -c proxy.c

pcache.o: pcache.c csapp.h pcache.h
	$(CC) $(CFLAGS) -c pcache.c

proxy: proxy.o csapp.o pcache.o

submit:
	(make clean; cd ..; tar cvf proxylab.tar proxylab-handout)

clean:
	rm -f *~ *.o proxy core

