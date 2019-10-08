syms t

% The missile path
rm = [5 + sin(t), 2 .* cos(t), 3 .* sqrt(t)];

% The distance between the missile and the craft as a function of time
missileshipdistance = norm(rm - r);
temp = matlabFunction(missileshipdistance);

% Plot the distance
vals = arrayfun(temp, 0:0.001:10);
minimum = min(vals);
minimumtime = find(vals == min(vals)) * 0.001;

fprintf("Minimum distance between space ship and missile: %.4f miles\n", minimum);
fprintf("This occurs at time: %.4f minutes\n", minimumtime);

fplot(missileshipdistance, [0,10], 'k', 'DisplayName', 'Rocket Path');
hold off;
xlabel("Time (minutes)");
ylabel("Distance between missile and Ship (Miles)");
title("Distance Between Ship and Missile from Time = [0,10] minutes")