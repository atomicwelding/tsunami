module mod_initial
  implicit none
contains
  pure subroutine init_gaussian(h, icenter, decay)
    real, dimension(:), intent(in out) :: h
    
    integer, intent(in) :: icenter
    real, intent(in) :: decay

    integer ::i 

    do concurrent (i=1:size(h)) 
       h(i) = exp(-decay * (i - icenter)**2)
    end do
  end subroutine init_gaussian
end module mod_initial
