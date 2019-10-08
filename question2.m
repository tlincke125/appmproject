% Question 2
syms t

% The starting and ending points
start = vpa(subs(r, t, 0));
ending = vpa(subs(r, t, 10));

% Make a clean vector string
string_start = sprintf("%d ", start);
string_ending = sprintf("%d ", ending);

% Print results
fprintf("Start: ( %s )\nEnd: ( %s )\n", string_start, string_ending);

% Find the norm of start and end and print it
AbsoluteDistance=vpa(norm(subs(r,t,0) - subs(r,t,10)));
fprintf("Absolute Distance (norm): %.4f", AbsoluteDistance);