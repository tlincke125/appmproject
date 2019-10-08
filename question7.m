
syms t;                                     % Symbolic placeholder for time (in minutes)

% Question 7
% Find those bad boys
curvature=norm(cross(v,a))/norm(v).^3;

x=0:0.0001:10;
curvaturevals = arrayfun(matlabFunction(curvature), x);
badvals = curvaturevals > 2;
ps = curvaturevals(badvals);
vs = x(badvals);

% Show where the general should worry
fprintf("The maximum curvature is %.4f\n", max(curvaturevals));
fprintf("The general needs to worry in the time interval of [%.4f, %.4f]\n", vs(1), vs(:,length(vs)));

% Plot those bad boys
fplot(curvature,[0, 10]);
hold on
plot(vs, ps, 'Color', 'r')
hold off
title('Curvature as a Function of Time')
xlabel('Time (minutes)')
ylabel('Curvature (1/miles)')