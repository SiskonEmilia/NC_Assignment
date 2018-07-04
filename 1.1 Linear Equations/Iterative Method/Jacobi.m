function X = Jacobi(A, b, x0, times)
format long

oriX = x0;
[row, col] = size(A);
X = x0;

for counter = 1 : times
    for indexR = 1 : row
        subsum = 0;
        for indexC = 1 : col
            if indexC ~= indexR
                subsum = subsum + oriX(indexC, 1) * A(indexR, indexC);
            end
        end
        X(indexR, 1) = (b(indexR, 1) - subsum) / A(indexR, indexR);
    end

    oriX = X;
end