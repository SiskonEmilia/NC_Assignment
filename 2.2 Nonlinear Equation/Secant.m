function [rsteps, rtimes, results] = Secant(TargetFunction, x0, x1)
    rsteps = ones(1, 100);
    rtimes = ones(1, 100);
    results = ones(1, 100);
    temp = x1;

    values = ones(1, 102);
    values(1, 1) = TargetFunction(x0);
    values(1, 2) = TargetFunction(x1);

    tic
    for index = 1 : 100
        x1 = x1 - values(index + 1) / (values(1, index + 1) - values(1, index)) * (x1 - x0);
        x0 = temp;
        temp = x1;

        rsteps(1, index) = index;
        rtimes(1, index) = toc;
        results(1, index) = x1;
        
        values(1, index + 2) = TargetFunction(x1);
    end
end 