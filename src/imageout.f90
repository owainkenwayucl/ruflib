module imageout

! Module for doing image output
! Owain Kenway

contains

! Write a 2D array out as a PGM.
! d is the 2D array (x,y) of pixels.
! cols is the max colour (colours go 0 -> col)
! u is the unit to write to.
  subroutine writepgm(d, x, y, cols, u)
    use iso_fortran_env
    implicit none
    integer, intent(in) :: x, y, cols, u
    integer, dimension(:,:), intent(in):: d
    integer :: i, j
    character(len=8) :: temp

! Write PGM header.
    write(u,"(A)") "P2"
    write(u,"(A)") "# Written by ruflib"
    write(u,"(2I8)") x,y
    write(u,"(1I8)") cols
    
! Loop over lines in array and write them out.
    do j=1,y
      do i=1,x
        write(u,*) d(i,j)
      end do
    end do

  end subroutine writepgm
 
end module imageout
