% Some constants
g=340; % ft/s^2

ti=0; % Start time
tf=10; % End time

syms t;
% Initialize all vector functions
fx = 10*sin(t)+5*sin(5*t)+2.5*sin(2.3*t);
fy = 10*cos(t)+5*cos(5*t)+2.5*cos(2.3*t);
fz = 0.001*t.^4*(1+(cos(2*pi*t).^2));

r = [fx, fy, fz];
v = diff(r);
a = diff(v);

% Question 5
anormal = (norm(cross(v, a)))/norm(v);

% Question 6
time=9.05;
% First generate the functional vectors
T=diff(v)/norm(diff(v));
N=diff(T)/norm(diff(T));
B=cross(T,N);

% Evaluate each at the time
aunit=a/norm(a);

Tv=vpa(subs(T, t, time));
Nv=vpa(subs(N, t, time));
Bv=vpa(subs(B, t, time));
pos=vpa(subs(r, t, time));
av=vpa(subs(aunit, t, time));

%
% Plot the three vectors [TODO Make look cleaner]

%plotvector(pos, pos + Tv);
%hold on
%plotvector(pos, pos + Nv);
%hold on
%plotvector(pos, pos + Bv);
%hold off

%fplot3(r(:,1), r(:,2), r(:,3), [8.9333333, 9.0933333]);
fplot3(r(:,1), r(:,2), r(:,3), [520/60, 555/60]);
hold on
for i=525/60:5/60:550/60
    plotvector(subs(r, t, i), subs(T + r, t, i));
    hold on
    plotvector(subs(r, t, i), subs(N + r, t, i));
    hold on
    plotvector(subs(r, t, i), subs(B + r, t, i));
    hold on
end
hold off










