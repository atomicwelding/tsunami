SRC = main.f90
EXEC = main

all: build


build: $(SRC)
	gfortran $(SRC) -o $(EXEC)

clean:
	rm -f main
