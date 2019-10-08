% Declare all quantities here so that large complex operations aren't carried out

syms t;                                     % Symbolic placeholder for time (in minutes)

% =============================== VECTOR FUNCTIONS ==================================
% Position
fx = 10*sin(t)+5*sin(5*t)+2.5*sin(2.3*t); % checked this, works
fy = 10*cos(t)+5*cos(5*t)+2.5*cos(2.3*t); % 
fz = 0.0005*t.^4*(3+(cos(4*pi*t)));
% Velocity
vx = 10*cos(t) + 25*cos(5*t) + 5.75*cos(2.3*t); % good, 
vy = -10*sin(t) - 25*sin(5*t) - 5.75*sin(2.3*t); % good
vz = 0.002*t.^3*(cos(4*pi*t)-pi*t*sin(4*pi*t)+3); % good
% Acceleration
ax=-10*sin(t)-125*sin(5*t)-13.225*sin(2.3*t); % good 
ay=-10*cos(t)-125*cos(5*t)-13.225*cos(2.3*t); % good
az=(3*t^2*(cos(4*pi*t) - t*pi*sin(4*pi*t) + 3))/500 - (t^3*(5*pi*sin(4*pi*t) + 4*t*pi^2*cos(4*pi*t)))/500;

% Initialize all vectored differentials
r = [fx, fy, fz];
v = [vx, vy, vz]; 
a = [ax, ay, az];

% Some other values evaluated here instead of functions to reduce
% computations
aunit=a/norm(a);                            % need this for problem 6

% Initialize some future vectored functions
T=diff(v)/norm(diff(v));
N=diff(T)/norm(diff(T));
B=cross(T,N);

