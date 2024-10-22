function result = ImageDrawerFactor(sizes, omegas)
% sizes is the sizes of tested dataset
    
[~, col] = size(sizes);
[~, col2] = size(omegas);
results = ones(col, 4);

    
for index = 1 : col

    V = diag(unifrnd(0, 1, 1, sizes(1, index))); % rand
    U = orth(rand(sizes(1, index)));
    A = U * V * U';

    b = normrnd(0, 1, sizes(1, index), 1);
    % Matrixes generated with Nomal Distribution 
    % cause the divergence in most cases

    x0 = zeros(sizes(1, index), 1);
    X = Elimination_MCP(A, b);

    for index2 = 1 : col2
        measureX = SOR(A, b, x0, 10, omegas(1, index2));
        measureX = measureX - X;
        measureX = measureX ./ X;
        measureX = abs(measureX);
        meanError = mean(measureX);
            
        results(index2, 1) = meanError;   
    end
    figure(sizes(1, index));
    plot(omegas, results(:,1));
    ylabel('Relative Error');
    xlabel('Omega');
    % results;
end
    
        