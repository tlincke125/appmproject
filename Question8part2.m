distance = matlabFunction(norm(r));
distvals=arrayfun(distance, xvals);
plot(distvals, torsionvals, '.', 'Color', 'r');
hold off
title("Torsion from Start to End of the Trip");
xlabel("Distance from the start (Miles)");
ylabel("Torsion (Newtons Per Square Meter)");