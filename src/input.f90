module rufinput

! Module full of useful I/O subroutines
! Owain Kenway

contains

! Read in an arbitray length string from unit u
! Based upon this Stackoverflow answer:
! http://stackoverflow.com/a/30632951
  subroutine rstr(u, inp)
    use iso_fortran_env
    implicit none
    integer, intent(in) :: u
    character(len = 1) :: buf
    character(len = :), allocatable, intent(out) :: inp
    integer :: ios

    inp = ""
    do
      read(u,'(a)', advance="no", iostat=ios) buf
      select case (ios)
      case(IOSTAT_EOR)
        exit
      case(0)
        inp = inp // buf
      end select

    end do

  end subroutine rstr

! Read in an arbitrary length string from stdin
  subroutine rstdin(inp)
    use iso_fortran_env
    implicit none
    character(len = :), allocatable, intent(out) :: inp

    call rstr(INPUT_UNIT, inp)

  end subroutine rstdin

end module rufinput
