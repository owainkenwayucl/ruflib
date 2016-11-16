program test

  use rufinput 
  use imageout
  use iso_fortran_env
  implicit none

  character(len=:), allocatable :: rin
  integer, dimension(5,6) :: img, img2
  integer :: i,j
  call rstdin(rin)
  write(*,*) len(rin)
  write(*,*) rin

  do i=i,5 
    do j=1,6
      img(i,j) = i + j
      img2(i,j) = 0
    end do
  end do

  open(unit=32, file="test.pgm")
  call writepgm(img, 5, 6, 11, 32)
  close(32)

  img2(2,2) = 10
  img2(4,2) = 10
  img2(2,5) = 10
  img2(3,5) = 10
  img2(4,5) = 10
  img2(4,3) =  5

  open(unit=31, file="test2.pgm")
  call writepgm(img2, 5, 6, 11, 31)
  close(31)


end program test
