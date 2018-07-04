function [result] = CompoundTrapezoidal(TargetFunction, N, a, b)
    n = N - 1;
    h = (b - a) / n;
    xs = a : h : b;
    ys = TargetFunction(xs);
    result = h / 2 * (sum(ys) + sum(ys(1, 2 : n)));
end