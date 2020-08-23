normalModes = 50;
delay = 0.05;
L = 100;

%box dimension
height = 8;
leftx = 35;
rightx = 65;

x = 0:.1:L; % horizontal distance
vp = 30; %phase velocity
A = zeros(1, normalModes);      % wave amplitude 
beta = zeros(1, normalModes); % phase lag
k = zeros(1, normalModes); %wave number
alpha = 0;

% Initialize plot: 
hold on

xlabel('distance (m)')
ylabel('wave height (m)') 
box off
axis([0 L -10 10])
ySum = 0;

%target shape
rectbase = animatedline('Color','black');
rectleft = animatedline('Color','black');
rectright = animatedline('Color','black');
baseAxis = animatedline('Color','black');
addpoints(rectbase, [leftx rightx], [height height]);
addpoints(rectleft, [leftx leftx], [height 0]);
addpoints(rectright, [rightx rightx], [0 height]);
addpoints(baseAxis, [0 L], [0 0]);
drawnow update

for m=1:normalModes
    % open ---- fixed end
    k(m) = (m-1/2) * pi/100;
    
    %amplitude
    A(m) = 2*height/(L * k(m)) * (sin(k(m)*rightx) - sin(k(m)*leftx));
    
    %number of normal modes
    annot = annotation('textbox', [0.7, 0.2, 0.12, 0.1]);
    annot.String = ['M = ', num2str(m)];              
    
    %draw normal modes
    y = A(m)*cos(k(m)*x + alpha); 
    ySum = ySum + y;
    waveM = animatedline('Color','r');
    addpoints(waveM,x,y); 
    
    %draw sum
    waveSum = animatedline('Color','b');
    addpoints(waveSum,x,ySum); 
    drawnow update
    
    pause(0.25)
    delete([waveSum annot])
end

w = vp*k;

clf

% Make an animation: 
for t= 0:.05:20
    xlabel('distance (m)')
    ylabel('wave height (m)') 
    box off
    axis([0 L -10 10])    
    
    %target shape
    rectbase = animatedline('Color','black');
    rectleft = animatedline('Color','black');
    rectright = animatedline('Color','black');
    addpoints(rectbase, [leftx rightx], [height height]);
    addpoints(rectleft, [leftx leftx], [height 0]);
    addpoints(rectright, [rightx rightx], [0 height]);
    drawnow update
    
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
    
    pause(delay)
    clf
end
  
hold off