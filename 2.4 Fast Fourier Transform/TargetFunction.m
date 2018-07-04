function [ y ] = TargetFunction(x, N)
    y = 0;
    y = y + sin(2 * pi * 2 * x / N);
    y = y + sin(5 * pi * 2 * x / N);
    y = y + sin(11 * pi * 2 * x / N);
    y = y + sin(17 * pi * 2 * x / N);
    y = y + sin(29 * pi * 2 * x / N);
end

