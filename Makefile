SRC = main.f90
MODS = mod_diff.f90 mod_initial.f90
EXEC = main

all: modules build


modules: $(MODS)
	gfortran -c mod_diff.f90
	gfortran -c mod_initial.f90

build: $(SRC) $(MODS)
	gfortran $(SRC) $(MODS) -o $(EXEC)

clean:
	rm -f main
