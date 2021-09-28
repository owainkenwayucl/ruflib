program test

  use rufinput 
  use imageout
  use rufansi
  use iso_fortran_env
  implicit none

  character(len=:), allocatable :: rin
  integer, dimension(5,6) :: img, img2
  integer :: i,j
  call rstdin(rin)
  
  write(*,*) "Testing input library - enter some text:"
  write(*,*) len(rin)
  write(*,*) rin

  call clearterm()
  write(*,*) "Testing image output:"
  write(*,*) "Generating image:"
  do i=1,5 
    do j=1,6
      img(i,j) = i + j
      img2(i,j) = 0
    end do
  end do

  write(*,*) "Writing first image."
  open(unit=32, file="test.pgm")
  call writepgm(img, 5, 6, 11, 32)
  close(32)

  write(*,*) "Generating Image 2."
  img2(2,2) = 10
  img2(4,2) = 10
  img2(2,5) = 10
  img2(3,5) = 10
  img2(4,5) = 10
  img2(4,3) =  5

  write(*,*) "Writing image 2 as PGM"
  open(unit=31, file="test2.pgm")
  call writepgm(img2, 5, 6, 11, 31)
  close(31)
  
  write(*,*) "Writing image 2 as PBM"
  open(unit=30, file="test3.pbm")
  call writepbm(img2, 5, 6, 5, 30)
  close(30)


end program test
