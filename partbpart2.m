fplot3(fx, fy, fz, [0,10], 'k', 'DisplayName', 'Rocket Path')
hold on
fplot3(rm(:,1), rm(:,2), rm(:,3), [0,10], 'r', 'DisplayName', 'Missile Path');
hold off
title("Position of Rocket and Missile as a Function of Time");
xlabel('x')
ylabel('y')
zlabel('z')
legend