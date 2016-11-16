test: input.o imageout.o test.o Makefile
	echo $(FC)
	$(FC) test.o imageout.o input.o -o test  

%.o:src/%.f90 Makefile 
	$(FC) -c $< -o $@

clean:
	rm -f *.o *.mod test
