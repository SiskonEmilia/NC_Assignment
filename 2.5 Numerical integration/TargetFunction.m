function [y] = TargetFunction(x)
    l = length(x);
    y = ones(1, l);
    for index = 1 : l
        if x(1, index) == 0
            y(1, index) = 1;
        else
            y(1, index) = sin(x(1, index)) / x(1, index);
        end
    end
end

