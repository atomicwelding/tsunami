program main
  implicit none


  ! parameters
  integer, parameter :: grid_size = 100, num_time_steps = 100
  real, parameter :: dt = 1., dx = 1., c = 1.


  integer, parameter :: icenter = 25
  real, parameter :: decay = 0.02
  

  ! variables
  integer :: n
  integer :: io
  
  real, dimension(grid_size) :: h, dh


  ! ensuring all values are defined
  if(grid_size <= 0 ) stop "grid_size must be > 0"
  if(num_time_steps <= 0) stop "num_time_steps must be > 0"
  if(dt <= 0 .OR. dx <= 0 .OR. c <=0) stop "dt, dx & c must be > 0"

  ! filling grid at t = 0
  call init_gaussian(h, icenter, decay)

  ! propagate
  open(newunit=io, file="save.txt")
  write(io,*) 0,h
  propagation: do n = 1, num_time_steps
     h = h - c * diff(h) / dx * dt
     write(io,*) n, h
  end do propagation
  close(io)
  
contains
  pure function diff(h) result(dh)
    real, dimension(:), intent(in) :: h
    real, dimension(size(h)) :: dh

    integer :: im

    im = size(h)
    dh(1) = h(1) - h(im)
    dh(2:im) = h(2:im) - h(1:im-1)
  end function diff

  pure subroutine init_gaussian(h, icenter, delay)
    real, dimension(:), intent(in out) :: h
    
    integer, intent(in) :: icenter
    real, intent(in) :: delay

    integer ::i 

    do concurrent (i=1:size(h)) 
       h(i) = exp(-decay * (i - icenter)**2)
    end do
  end subroutine init_gaussian
end program main
