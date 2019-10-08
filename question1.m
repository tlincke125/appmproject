% Question 1
tempx = matlabFunction(fx);
tempy = matlabFunction(fy);
tempz = matlabFunction(fz);

t=0:1/60:10;
% Show that the size is 601 points
fprintf("Size of time interval: %d", length(t));

X=tempx(t);
Y=tempy(t);
Z=tempz(t);

% Plot 601 points from 0 to 10
plot3(X, Y, Z, '.', 'Color', 'k')
hold on;

% Plot a continuous plot from 0 to 10 in light blue
fplot3(fx, fy, fz, [0,10], 'c')
hold on

% Plot the starting point
r0 = vpa(subs(r, 0));
plot3(r0(:,1), r0(:,2), r0(:,3),'g o')
hold on

% Plot the ending point
r10 = vpa(subs(r, 10));
plot3(r10(:,1), r10(:,2), r10(:,3), 'r o ')
hold off

% Some configuration to the plot
grid on;
title('Escape Flight Path from t = [0, 10] Minutes')
xlabel('x')
ylabel('y')
zlabel('z')
legend('Discrete Flight Path', 'Continuous Flight Path', 'Beginning', 'End')

