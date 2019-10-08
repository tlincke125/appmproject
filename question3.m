% Question 3
syms t

% Make a matlab function for an easier calculation
symspeedfunc=norm(v);
speedfunc=matlabFunction(symspeedfunc);

% Weight in lbs
lbs=150;

% Find the displacement in a vpa
displacementvpa = vpaintegral(symspeedfunc, t, [0, 10]);

% Find the displacement in an anonymous to check
displacement = integral(speedfunc, 0, 10);

% Find the amount of trash
trash = lbs*displacement;

% Print results
fprintf("Absolute displacement using symbolic approximation: %.4f\n", displacementvpa);
fprintf("Absolute displacement using anonymous approximation: %.4f\n", displacement);
fprintf("Amount of trash used: %.4f lbs (%.4f tons)", trash, 0.0005 * trash);