normalModes = 10;

x = 0:.1:100; % horizontal distance
vp = 30 %phase velocity
A = [1 1.5 2 2.5 3 2.1 1 0.5 0.7 1.2];      % wave amplitude 
beta = [pi/6 pi -pi/2 -pi/3 0 -pi/6 pi/4 pi*3/2 pi/6 pi/5] % phase lag
k = []; %wave number
alpha = 0;

for m=1:normalModes
    % open ---- fixed end
    k = [k (m-1/2) * pi/100];
    
    % fixed ---- open end
    %k = [k (m - 1/2) * pi/100]; 
    %alpha = -3*pi/2; 
    
    % open ---- open end
    %k = [k (m) * pi/100]; 
    
    % fix ---- fix end
    %k = [k (m) * pi/100]; 
    %alpha = pi/2;
end

w = vp*k

% Initialize plot: 
hold on

% Make an animation: 
for t= 0:.05:20
    xlabel('distance (m)')
    ylabel('wave height (m)') 
    box off
    axis([0 100 -10 10])

    ySum = 0;
    
    for m=1:normalModes
        y = A(m)*cos(k(m)*x + alpha)*cos(w(m)*t + beta(m)); 
        ySum = ySum + y;
        hwave = animatedline('Color','r');
        addpoints(hwave,x,y); 
        drawnow update
    end
    hwave = animatedline('Color','b');
    addpoints(hwave,x,ySum); 
    drawnow update
    
    pause(.05)
    clf
end
  
hold off