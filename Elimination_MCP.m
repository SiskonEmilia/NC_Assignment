format long
% Print numbers as long as possible

A = input('Please type in the matrix A you want to solve:\n');
b = input('Please type in the vector b that your equations results in:\n');

[row1, col1] = size(A);
[row2, col2] = size(b);

if row1 ~= col1
    'The matrix you input is not a square one.'
    return;
elseif row1 ~= row2
    'Matrix A and vector b does not match.'
    return;
end

tic % start timing

C = [A, b];
% Startup Gaussian Elimination

for index =  1 : row1-1
    % Find the Maximum Column Pivot
    pivotElement = C(index, index);
    targetRow = index;
    for current = index + 1 : row1
        if abs(pivotElement) < abs(C(current, index))
            targetRow = current;
            pivotElement = C(current, index);
        end
    end

    % Swap
    tempRow = C(index, :);
    C(index, :) = C(targetRow, :);
    C(targetRow, :) = tempRow;

    % Get current Row and the pivot element
    currentRow = C(index,:);
    pivotElement = C(index, index);
   
    % Exit if pivot element is zero
    if pivotElement == 0
        'There is still a zero pivot element!'
        return;
    end

    % Elimination
    for current = index + 1 : row1
        m = C(current, index) / pivotElement;
        C(current,:) = C(current,:) - currentRow * m;
    end
end

'The lower triangular matrix is:'
C

% Back substitution process
X = ones(col1, 1);
X(col1, 1) = C(row1, col1 + 1) / C(row1, row1);
for k = row1 - 1 : -1 : 1
    subsum = 0;
    for j = k + 1 : row1
        subsum = subsum + C(k, j) * X(j, 1);
    end
    X(k, 1) = (C(k, col1 + 1) - subsum) / C(k, k);
end

'The result vector X is:'
X
toc % end timing