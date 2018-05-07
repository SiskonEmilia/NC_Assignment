function result = ImageDrawerTime(sizes, times)
% sizes is the sizes of tested dataset
% toTest is the function to test
    
[~, col] = size(sizes);
[~, col2] = size(times);
results = ones(col, 5);

    
for index = 1 : col

    V = diag(unifrnd(0, 1, 1, sizes(1, index)));
    U = orth(rand(sizes(1, index)));
    A = U * V * U';

    b = normrnd(0, 1, sizes(1, index), 1);
    % Matrixes generated with Nomal Distribution 
    % cause the divergence in most cases

    x0 = zeros(sizes(1, index), 1);
    % X = Elimination_MCP(A, b);

    for index2 = 1 : col2
        tic
        Jacobi(A, b, x0, times(1, index2));
        results(index2, 1) = toc;
    
        tic
        Gauss_Seidel(A, b, x0, times(1, index2));
        results(index2, 2) = toc;

        tic
        Conjugate_Gradient(A, b, x0, times(1, index2));
        results(index2, 3) = toc;
    
        tic
        SOR(A, b, x0, times(1, index2), 1.3);
        results(index2, 4) = toc;

        tic
        Elimination_MCP(A, b);
        results(index2, 5) = toc;
    end
    figure(sizes(1, index));
    hold on; % Multiple Lines on the same figure.
    plot(times, results(:,1));
    plot(times, results(:,2));
    plot(times, results(:,3));
    plot(times, results(:,4));
    plot(times, results(:,5));
    hold off;
    legend('Jacobi', 'Gauss Seridel', 'Conjugate Gradient', 'SOR', 'Elimination MCP');
    ylabel('Time(s)');
    xlabel('Times of Iterating');
    % results;
end

    