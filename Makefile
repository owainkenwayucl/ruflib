FC=nagfor

test: input.o test.o Makefile
	$(FC) test.o input.o -o test  

%.o:src/%.f90 Makefile 
	$(FC) -c $< -o $@

clean:
	rm -f *.o *.mod test
