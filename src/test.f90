program test

  use rufinput 
  use iso_fortran_env
  implicit none

  character(len=:), allocatable :: rin

  call rstdin(rin)

  write(*,*) len(rin)
  write(*,*) rin

end program test
