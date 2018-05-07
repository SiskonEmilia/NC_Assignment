function result = ImageDrawerFactor(sizes, factors)
% sizes is the sizes of tested dataset
% toTest is the function to test
    
[~, col] = size(sizes);
[~, col2] = size(factors);
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
        measureX = SOR(A, b, x0, 10, factors(1, index2));
        measureX = measureX - X;
        measureX = measureX ./ X;
        measureX = abs(measureX);
        meanError = mean(measureX);
            
        results(index2, 1) = meanError;   
    end
    figure(sizes(1, index));
    plot(factors, results(:,1));
    ylabel('Relative Error');
    xlabel('Factor');
    % results;
end
    
        