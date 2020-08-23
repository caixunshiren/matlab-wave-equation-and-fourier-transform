# matlab-wave-equation-and-fourier-transform
Simulating standing waves with normal modes in matlab. Creating square pulse using fourier decomposition.


Fourier_Decomposition_square_pulse.m:   this sqaure pulse is created on an open --- closed end system
- change the variable normalModes to change the number of normal modes that approximate the square pulse
- play around with the box dimension to create the box that you want to approximate
- you can also change the phase velocity vp to change the speed of the pulse propagation

StandingWave.m: 
- play around with the variable normalModes to change the number of normal modes and change the phase velocity vp to change the speed of the pulse propagation
- you can also change variable A and beta:
    - A is the amplitude matrix with size equal to the number of normal modes. You can change the amplitude of each normal mode
    - beta is the phase lag for each normal mode which you can also modify
- k and alpha are determined by boundary conditions. That is, no need to change them. you can change the boundary condition setting by uncommenting the lines in the for loop
