module rufansi

contains

 subroutine clearterm()
   use iso_fortran_env
   implicit none

   write(*,'(A,$)') achar(27)//"[2J"//achar(27)//"[;H"

 end subroutine clearterm

end module rufansi
