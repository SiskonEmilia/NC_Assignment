function result = ImprovedEuler(TargetFunction, a, b, h, y0)
    result = ones(1, (b - a) / h);
    x0 = a;
    for index = 1 : (b - a) / h
        y1 = y0 + h * TargetFunction(x0, y0);
        x1 = x0 + h;
        y1 = y0 + h / 2 * (TargetFunction(x0, y0) + TargetFunction(x1, y1));
        result(1, index) = y1;
        x0 = x1;
        y0 = y1;
    end
end