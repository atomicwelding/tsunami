program main
  use iso_fortran_env, only: int32, real32
  use mod_diff, only: diff => diff_centered
  use mod_initial, only: init_gaussian
  
  implicit none
  
  ! parameters
  integer(int32), parameter :: grid_size = 100, num_time_steps = 5000
  real(real32), parameter :: dt = 0.02, dx = 1., g = 9.8, hmean = 10.


  integer(int32), parameter :: icenter = 25
  real(real32), parameter :: decay = 0.02
  

  ! variables
  integer :: n, io
  
  real(real32), dimension(grid_size) :: h, u
  
  ! filling grid at t = 0
  call init_gaussian(h, icenter, decay)
  u = 0

  ! propagate
  open(newunit=io, file="save.txt")
  write(io,*) 0,h
  propagation: do n = 1, num_time_steps
     u = u - (u * diff(u) + g * diff(h)) / dx * dt
     h = h - diff(u * (hmean + h)) / dx * dt
     write(io,*) n, h
  end do propagation
  close(io)
  
end program main
