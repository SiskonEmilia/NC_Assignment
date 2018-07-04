function result = ImageDrawerTime(sizes, times)
% sizes is the sizes of tested dataset
    
[~, col] = size(sizes);
[~, col2] = size(times);
results = ones(col2, 6);
subsum = ones(1, 10);

for index = 1 : col

    while true
        V = diag(unifrnd(0, 1, 1, sizes(1, index)));
        U = orth(rand(sizes(1, index)));
        A = U * V * U';
        if min(min(eig(2 * diag(diag(A)) - A))) > 0
            % Check whether it meet the requirement of Jacobi Algorithm
            % If it does, break the loop
            break;
        end
    end

    b = normrnd(0, 1, sizes(1, index), 1);
    % Matrixes generated with Nomal Distribution 
    % cause the divergence in most cases

    x0 = zeros(sizes(1, index), 1);
    % X = Elimination_MCP(A, b);

    for index2 = 1 : col2
        

        for counter = 1 : 10
            tic
            Jacobi(A, b, x0, times(1, index2));
            subsum(1, counter) = toc;
        end
        results(index2, 1) = min(min(subsum));
    
        for counter = 1 : 10
            tic
            Gauss_Seidel(A, b, x0, times(1, index2));
            subsum(1, counter) = toc;
        end
        results(index2, 2) = min(min(subsum));

        for counter = 1 : 10
            tic
            Conjugate_Gradient(A, b, x0, times(1, index2));
            subsum(1, counter) = toc;
        end
        results(index2, 3) = min(min(subsum));
    
        for counter = 1 : 10
            tic
            SOR(A, b, x0, times(1, index2), 1.3);
            subsum(1, counter) = toc;
        end
        results(index2, 4) = min(min(subsum));

        tic
        Elimination_MCP(A, b);
        results(index2, 5) = toc;

        tic
        Gaussian_Elimination(A, b);
        results(index2, 6) = toc;
    end
    results(:,5) = mean(results(:,5));
    results(:,6) = mean(results(:,6));

    figure(sizes(1, index));
    hold on; % Multiple Lines on the same figure.
    plot(times, results(:,1));
    plot(times, results(:,2));
    plot(times, results(:,3));
    plot(times, results(:,4));
    plot(times, results(:,5));
    plot(times, results(:,6));
    hold off;
    legend('Jacobi', 'Gauss Seridel', 'Conjugate Gradient', 'SOR', 'Elimination MCP', 'Gaussian Elimination');
    ylabel('Time(s)');
    xlabel('Times of Iterating');
    % results;
end

    