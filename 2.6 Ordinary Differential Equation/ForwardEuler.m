function [result] = ForwardEuler(TargetFunction, a, b, h, y0)
    result = ones(1, (b - a) / h);
    x0 = a;
    for index = 1 : (b - a) / h
        y0 = y0 + h * TargetFunction(x0, y0);
        x0 = x0 + h;
        result(1, index) = y0;
    end
end