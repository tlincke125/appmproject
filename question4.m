%Question 4
syms t

% Velocity as a function of seconds
velocsec = subs(norm(v), t/60);

% Anonymous function form
velocFun = matlabFunction(velocsec); % divide by 60 to turn into seconds unit 

% Extract an array to plot
x=0:0.01:600; % 600 seconds max
velocityvals = arrayfun(velocFun, x);

% Find the peaks in velocity vals and then find the maximum peak
peaks = findpeaks(velocityvals);
maximum = max(peaks);
timemax = find(velocityvals == maximum) * 0.01;

% Print The largest speed
fprintf("Max speed from 0 to 10 Minutes: %.4f miles per second\n", maximum / 60);
fprintf("Max speed from 0 to 10 Minutes: %.4f miles per minute\n", maximum);
fprintf("Time of max speed t: %.4f seconds (%.4f minutes)", timemax, timemax / 60)

% Now plot the speed over the 0 to 10 interval
plot(0:0.01:600, velocityvals ./ 60, 'DisplayName', 'Speed');
hold off
title('Escape Speed from t = 0 to t = 10')
xlabel('Time (Seconds)')
ylabel('Velocity (Miles Per Second)')