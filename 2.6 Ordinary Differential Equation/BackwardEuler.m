function [result] = BackwardEuler(TargetFunction, a, b, h, y0, delta)
    result = ones(1, (b - a) / h);
    x0 = a;
    for index = 1 : (b - a) / h
        y1 = y0 + h * TargetFunction(x0, y0);
        x0 = x0 + h;
        while true
            ny1 = y0 + h * TargetFunction(x0, y1);
            if abs(ny1 - y1) <= delta
                y1 = ny1;
                break;
            end
            y1 = ny1;
        end
        result(1, index) = y1;
        y0 = y1;
    end
end