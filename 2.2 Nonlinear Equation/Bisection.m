function [rsteps, rtimes, results] = Bisection(TargetFunction, a, b)
    rsteps = ones(1, 100);
    rtimes = ones(1, 100);
    results = ones(1, 100);
    tic
    leftvalue = TargetFunction(a);
    for index = 1 : 100
        middle = (a + b) / 2;
        if TargetFunction(middle) * leftvalue < 0
            b = middle;
        else
            a = middle;
        end
        rtimes(1, index) = toc;
        rsteps(1, index) = index;
        results(1, index) = (a + b) / 2;
        leftvalue = TargetFunction(a);
    end
end