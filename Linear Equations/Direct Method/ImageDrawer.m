function result = ImageDrawer(sizes, toTest1, toTest2)
    % sizes is the sizes of tested dataset
    % toTest is the function to test
    
    
    [~, col] = size(sizes);
    results = ones(col, 2);
    
    for index = 1 : col
    
        A = normrnd(0, 1, sizes(1, index), sizes(1, index));
        b = normrnd(0, 1, sizes(1, index), 1);
    
        tic
        toTest1(A, b);
        results(index, 1) = toc;
    
        tic
        toTest2(A, b);
        results(index, 2) = toc;
    
    end
    
    plot(sizes, results(:,1));
    hold on;
    % Multiple Lines on the same figure.
    
    plot(sizes, results(:,2));
    ylabel('Time(s)');
    xlabel('Size');