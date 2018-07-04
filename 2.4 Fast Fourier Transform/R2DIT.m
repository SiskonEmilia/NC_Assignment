function [result] = R2DIT(x)
    N = length(x);
    
    if N == 1
        result = x;
        return;
    end

    wFactor = exp(-1i * 2 * pi / N);
    result = zeros(1, N); % N-die Vector
    k = 0 : N / 2 - 1; % k = 0 -> N / 2 - 1
    n = k + 1;

    xo(n) = x(2 * n);
    xe(n) = x(2 * n - 1);
    XO = R2DIT(xo);
    XE = R2DIT(xe);

    for k = 0 : N/2 - 1
        n = k + 1;
        result(n) = XE(n) + XO(n) * (wFactor ^ k); % xk = Ek + Ok * factor ^ k
        result(n + N/2) = XE(n) - XO(n) * (wFactor ^ k); % xk+n/2 = Ek - Ok * factor ^ k
    end
end