# tsunami

The main point of the book is to learn Fortran, by solving the shallow water equations.

$$
\begin{aligned}
\partial_t u + u\cdot\nabla u &= -g \nabla h \\
\partial_t h &= - \nabla \cdot u(H + h)
\end{aligned}
$$

Where $u$ the velocity of the fluid, $h$ the height of the fluid, $H$ the mean water depth and $g$ the gravitational constant.
