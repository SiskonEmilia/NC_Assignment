function [result] = CompoundSimpson(TargetFunction, N, a, b)
    n = (N - 1) / 2;
    h = (b - a) / n;
    xs = a : h : b;
    ys = TargetFunction(xs);
    xs2 = xs + h / 2;
    ys2 = TargetFunction(xs2);
    result = h / 6 * (sum(ys) + sum(ys(1, 2 : n)) + 4 * sum(ys2(1, 1 : n)));
end