module mod_diff
  use iso_fortran_env, only: real32, int32
  implicit none
contains
  pure function diff_centered(h) result(dh)
    real(real32), dimension(:), intent(in) :: h
    real(real32), dimension(size(h)) :: dh

    integer(int32) :: im

    im = size(h)
    dh(1) = h(2) - h(im)
    dh(im) = h(1) - h(im-1)
    dh(2:im-1) = h(3:im) - h(1:im-2)
    dh = 0.5 * dh
  end function diff_centered
end module mod_diff
