function X = SOR(A, b, x0, times, omega)
format long

X = x0;
[row, col] = size(A);

for counter = 1 : times
    for indexR = 1 : row
        subsum = 0;
        for indexC = 1 : col
            subsum = subsum + X(indexC, 1) * A(indexR, indexC);
        end
        X(indexR, 1) =  X(indexR, 1) + omega * (b(indexR, 1) - subsum) / A(indexR, indexR);
    end
end