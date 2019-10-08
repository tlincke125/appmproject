% Question 5

% Discretize the values to find a max
anormal(t)= 5280/3600 * (norm(cross(v, a)))/norm(v);

% Create an anonymous function for easier peak finding
temp = matlabFunction(anormal);
anormalvals = arrayfun(temp, 0:0.0001:10);

% Find the peaks of the function
pks=findpeaks(anormalvals);
maximum=max(pks);
timemax = 0.0001*find(anormalvals==maximum);
tangential = sqrt(vpa(subs(norm(a), timemax)).^2 - (maximum/3).^2);

% Get some clean vector strings
accel = vpa(subs(a, t, timemax));
veloc = vpa(subs(v, t, timemax));

% Make a clean vector string
accel_string = sprintf("%d ", accel);
veloc_string = sprintf("%d ", veloc);

% Print results
fprintf("Velocity: ( %s )\nAccel: ( %s )\n\n", veloc_string, accel_string);

% Cleanly print results
fprintf("Max should not exceed the value of %.4f\n", 340 * 3);
fprintf("Max value from 0 to 10 is: %.4f ft / s*s at t = %.4f minutes\n", maximum);
fprintf("Max value from 0 to 10 is at time: %.4f minutes\n\n", timemax);
fprintf("Tangential Acceleration at said time is %.4f ft / s*s\n\n", tangential);
fprintf("Comparing speed before and after shows the ship is: ")
if (vpa(subs(norm(v), timemax - 0.0001)) < vpa(subs(norm(v), timemax + 0.0001)))
    fprintf("Speeding Up\n\n");
else
    fprintf("Slowing Down\n\n");
end

fprintf("First time: 9.738 - 9.7625 minutes, second time 9.9977 - 10 minutes\n")
fprintf("First time: %.4f - %.4f seconds, second time %.4f - %.4f seconds\n", 9.783 * 60, 9.7625 * 60, 9.9977 * 60, 600);


% Plot the results
x = 0:0.0001:10;
vs = anormalvals > 1020;
ps = anormalvals(vs);
fplot(anormal,[0,10], 'Color', 'g', 'DisplayName','Normal Acceleration');
hold on;
plot(x(vs), ps, '.', 'Color', 'r');
hold off;
title("Normal Acceleration from t = 0 to t = 10 Minutes");
xlabel("Time (Minutes)");
ylabel("Normal Acceleration (Feet per Square Seconds)");