test: ansi.o input.o imageout.o test.o Makefile
	$(FC) test.o ansi.o imageout.o input.o -o test  

%.o:src/%.f90 Makefile 
	$(FC) -c $< -o $@

clean:
	rm -f *.o *.mod test *.pgm *.pbm
