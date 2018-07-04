function [rsteps, rtimes, results] = SimplifiedNewton(TargetFunction, TargetFunctionDerivative, x0)
    rsteps = ones(1, 100);
    rtimes = ones(1, 100);
    results = ones(1, 100);
    derivate = TargetFunctionDerivative(x0);

    tic
    for index = 1 : 100
        x0 = x0 - TargetFunction(x0) / derivate;
        rsteps(1, index) = index;
        rtimes(1, index) = toc;
        results(1, index) = x0;
    end
end

