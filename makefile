CC = g++

CFLAGS  = -Wall -O3 -I/usr/include -std=c++14
LDFLAGS = -lm -lgsl -lgflags -lglog -lcblas -L/usr/lib
BIN = embedder
OBJ = hyperboliclinear.o hyperbolic.o graph.o random.o springembedder.o geometricds.o powerlawCommon.o NLEHelper.o

main: main.o
	$(CC) $(CFLAGS) $(DEFINE) -o $(BIN) main.o $(OBJ) $(LDFLAGS)

main.o: hyperboliclinear.o hyperbolic.o graph.o springembedder.o NLEHelper.o
NLEHelper.o: plfit/powerlawCommon.o
springembedder.o: geometricds.o
hyperboliclinear.o: hyperbolic.o graph.o random.o geometricds.o
graph.o: random.o
hyperbolic.o: graph.o random.o


%.o: %.cpp
	$(CC) $(CFLAGS) -c $<

.PHONY: clean
clean:
	rm -rf $(BIN) $(OBJ) main.o
