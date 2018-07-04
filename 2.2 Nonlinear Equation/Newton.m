function [rsteps, rtimes, results] = Newton(TargetFunction, TargetFunctionDerivative, x0)
    rsteps = ones(1, 100);
    rtimes = ones(1, 100);
    results = ones(1, 100);
    
    tic
    for index = 1 : 100
        x0 = x0 - TargetFunction(x0) / TargetFunctionDerivative(x0);
        rsteps(1, index) = index;
        rtimes(1, index) = toc;
        results(1, index) = x0;
    end
end

