import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation

# Load data from file
data = np.loadtxt("save.txt")

# Define spatial domain
dx = 1.0
x = data[:, 0] * dx

# Create a figure and axis
fig, ax = plt.subplots()
line, = ax.plot([], [], lw=2)

# Set x and y limits
ax.set_xlim(np.min(x), np.max(x))
ax.set_ylim(-0.1, 1.1)

# Initialization function for blitting
def init():
    line.set_data([], [])
    return line,

# Animation function
def animate(t):
    line.set_data(x, data[t, 1:])
    return line,

# Create the animation
ani = animation.FuncAnimation(
    fig, animate, frames=100, init_func=init, interval=10, blit=True, repeat=True
)

# Show the animation
plt.show()
