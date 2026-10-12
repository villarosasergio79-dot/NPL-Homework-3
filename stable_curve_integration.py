import numpy as np
import matplotlib.pyplot as plt

a = -1
s = np.sqrt(1 - 4*a)

pfp = (1 + s)/2 # saddle fixed point (fp)
pfm = (1 - s)/2 # sink fixed point 

lambda_2_p = (s + np.sqrt(s**2 + 4*s))/2 # positive eigenvalue of the saddle
lambda_1_p = (s - np.sqrt(s**2 + 4*s))/2 # negative eigenvaule of the saddle

# Time integration for stable curve of saddle point
dt = 0.1
Tu = 4.5
Td = 6
Nu = int(Tu/dt)
Nd = int(Td/dt)

v = dt*np.array([1+lambda_1_p, 1]) # small perturbation of the fixed point in 
                                   # the direction we wish to integrate

x0_u, y0_u = pfp+v[0], pfp+v[1] # upwards perturbation 
x0_d, y0_d = pfp-v[0], pfp-v[1] # downwards perturbation 

scu_x = np.empty(Nu) # upwards stable curve
scu_y = np.empty(Nu)

scd_x = np.empty(Nd) # downwards stable curve
scd_y = np.empty(Nd)

scu_x[0] = x0_u
scu_y[0] = y0_u

scd_x[0] = x0_d
scd_y[0] = y0_d

def fx(x,y):
    return x**2 - y + a

def fy(x,y):
    return x - y

for n in range(Nu-1): 
    scu_x[n+1] = scu_x[n] - dt*fx(scu_x[n] - dt/2*fx(scu_x[n],scu_y[n]),
                                  scu_y[n] - dt/2*fy(scu_x[n],scu_y[n]))
    scu_y[n+1] = scu_y[n] - dt*fy(scu_x[n] - dt/2*fx(scu_x[n],scu_y[n]),
                                  scu_y[n] - dt/2*fy(scu_x[n],scu_y[n]))

for n in range(Nd-1):
    scd_x[n+1] = scd_x[n] - dt*fx(scd_x[n] - dt/2*fx(scd_x[n],scd_y[n]),
                                  scd_y[n] - dt/2*fy(scd_x[n],scd_y[n]))
    scd_y[n+1] = scd_y[n] - dt*fy(scd_x[n] - dt/2*fx(scd_x[n],scd_y[n]),
                                  scd_y[n] - dt/2*fy(scd_x[n],scd_y[n]))


# 1D arrays
x = np.arange(-5,5,0.1)
y = np.arange(-5,5,0.1)

v1_p = 1/(1 + lambda_1_p)*x + pfp*(1 - 1/(1 + lambda_1_p)) 
v2_p = 1/(1 + lambda_2_p)*x + pfp*(1 - 1/(1 + lambda_2_p))  
# Meshgrid
X,Y = np.meshgrid(x,y)

# Assign vector directions
Ex = X**2 - Y + a
Ey = X -Y

fig, ax = plt.subplots(1,1, figsize=(5, 5))

plt.streamplot(X,Y,Ex,Ey, density=1.6, linewidth=0.8, color='#0072BD')

ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
# isocline en x et en y
#plt.plot(x, x**2 + a, '--', color='darkorange')
#plt.plot(x, x, '--', color='darkolivegreen')

plt.plot(scu_x, scu_y, color='#ff8c00')
plt.plot(scd_x, scd_y, color='#ff8c00')

plt.plot(pfp,pfp,'-or')
plt.plot(pfm,pfm,'-or')

# Show plot with grid
plt.grid()
plt.show()
