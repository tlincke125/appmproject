% Part B
fplot3(r(:,1), r(:,2), r(:,3), [520/60, 555/60], 'Color', 'k', 'DisplayName','Path');
hold on
for i=525/60:5/60:550/60
    temp = subs(r,t,i);
    plotvector(temp, subs(T + r, t, i), 'r', false);
    hold on
    plotvector(temp, subs(N + r, t, i), 'g', false);
    hold on
    plotvector(temp, subs(B + r, t, i), 'b', false);
    hold on
end

% Plot the final vector (doing this so that I can label it
% Plot three vectors automatically removes labels
plotvector(subs(r, t, i), subs(T + r, t, i), 'r', 'Unit Tangent');
hold on
plotvector(subs(r, t, i), subs(N + r, t, i), 'g', 'Unit Normal');
hold on
plotvector(subs(r, t, i), subs(B + r, t, i), 'b', 'Unit Binormal');
hold off
legend
title('Unit Tangent Normal and Binormal Vectors from t = [520, 550] Seconds')