% Question 8

syms t;                                     % Symbolic placeholder for time (in minutes)

% Question 8 values
torsion=(dot(-N, diff(B)));
temp=matlabFunction(torsion);
xvals=0:0.01:10;

torsionvals=arrayfun(temp, xvals);

displacement= matlabFunction(norm(v));
func = @(x) integral(displacement, 0, x);
dispvals=arrayfun(func, xvals);

plot(dispvals, torsionvals, '.');
hold off
title("Torsion from Start to End of the Trip");
xlabel("Displacement from the start (Miles)");
ylabel("Torsion (Newtons Per Square Meter)");


