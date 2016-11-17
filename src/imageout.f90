module imageout

! Module for doing image output
! Owain Kenway

contains

! Write a 2D array out as a PGM.
! d is the 2D array (x,y) of pixels.
! cols is the max colour (colours go 0 -> col)
! u is the unit to write to.
  subroutine writepgm(d, x, y, cols, u)
    implicit none
    integer, intent(in) :: x, y, cols, u
    integer, dimension(:,:), intent(in):: d
    integer :: i, j

! Write PGM header.
    write(u,"(A)") "P2"
    write(u,"(A)") "# Written by ruflib:"
    write(u,"(A)") "# https://github.com/owainkenwayucl/ruflib"
    write(u,"(2I8)") x,y
    write(u,"(1I8)") cols
    
! Loop over lines in array and write them out.
    do j=1,y
      do i=1,x
        write(u,*) d(i,j)
      end do
    end do

  end subroutine writepgm

! Write a 2D array out as a PBM.
! d is the 2D array (x,y) of pixels.
! th is the threshold at which a number is 1 rather than 0
! u is the unit to write to.
  subroutine writepbm(d, x, y, th, u)
    implicit none
    integer, intent(in) :: x, y, u, th
    integer, dimension(:,:), intent(in):: d
    integer :: i, j

! Write PGM header.
    write(u,"(A)") "P1"
    write(u,"(A)") "# Written by ruflib:"
    write(u,"(A)") "# https://github.com/owainkenwayucl/ruflib"
    write(u,"(2I8)") x,y
    
! Loop over lines in array and write them out.
    do j=1,y
      do i=1,x
        if (d(i,j) .ge. th) then
          write(u,*) 1
        else
          write(u,*) 0
        end if
      end do
    end do

  end subroutine writepbm
 
end module imageout
