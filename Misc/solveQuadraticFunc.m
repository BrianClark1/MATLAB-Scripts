function [x1, x2] = solveQuadraticFunc(a, b, c)
delta = calcDelta(a, b, c);

if delta >= 0
    x1 = (-b+sqrt(delta))/2/a;
    x2 = (-b-sqrt(delta))/2/a;
else
    x1 = (-b+sqrt(-delta)*1i)/2/a;
    x2 = (-b-sqrt(-delta)*1i)/2/a;
end

end

function delta = calcDelta(a, b, c)
delta = b^2-4*a*c;
end