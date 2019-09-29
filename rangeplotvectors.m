function rangeplotvectors(posfunc,vectors,start,last,increment)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
syms t;
for i=start:increment:last
    for j=1:length(vectors)
        plotvector(subs(posfunc, t, i), subs(vectors(i), t, i));
    end
end

end