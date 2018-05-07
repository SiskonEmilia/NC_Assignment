function result = ImageDrawerError(sizes, times)
% sizes is the sizes of tested dataset
% toTest is the function to test
    
[~, col] = size(sizes);
[~, col2] = size(times);
results = ones(col, 4);

    
for index = 1 : col

    V = diag(unifrnd(0, 1, 1, sizes(1, index)));
    U = orth(rand(sizes(1, index)));
    A = U * V * U';

    b = normrnd(0, 1, sizes(1, index), 1);
    % Matrixes generated with Nomal Distribution 
    % cause the divergence in most cases

    x0 = zeros(sizes(1, index), 1);
    X = Elimination_MCP(A, b);

    for index2 = 1 : col2
        measureX = Jacobi(A, b, x0, times(1, index2));
        measureX = measureX - X;
        measureX = measureX ./ X;
        measureX = abs(measureX);
        meanError = mean(measureX);
            
        results(index2, 1) = meanError;
    
        measureX = Gauss_Seidel(A, b, x0, times(1, index2));
        measureX = measureX - X;
        measureX = measureX ./ X;
        measureX = abs(measureX);
        meanError = mean(measureX);
    
        results(index2, 2) = meanError;

        measureX = Conjugate_Gradient(A, b, x0, times(1, index2));
        measureX = measureX - X;
        measureX = measureX ./ X;
        measureX = abs(measureX);
        meanError = mean(measureX);
    
        results(index2, 3) = meanError;
    
        measureX = SOR(A, b, x0, times(1, index2), 1.3);
        measureX = measureX - X;
        measureX = measureX ./ X;
        measureX = abs(measureX);
        meanError = mean(measureX);
    
        results(index2, 4) = meanError;

    end
    figure(sizes(1, index));
    hold on; % Multiple Lines on the same figure.
    plot(times, results(:,1));
    plot(times, results(:,2));
    plot(times, results(:,3));
    plot(times, results(:,4));
    hold off;
    legend('Jacobi', 'Gauss Seridel', 'Conjugate Gradient', 'SOR');
    ylabel('Relative Error');
    xlabel('Times of Iterating');
    % results;
end

    