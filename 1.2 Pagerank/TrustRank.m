function V = TrustRank()
% @return: 
format long
% Data info:
% filename: data.txt
% Directed graph (each unordered pair of nodes is saved once)
% Directed Epinions social network
% Nodes: 75879 Edges: 508837
% FromNodeId	ToNodeId
% %d %d

matrixSize = 75888;
delta = 1 / matrixSize / 100;

[f, message] = fopen('data.txt', 'rt');
if f == -1
    disp(message) % If error happens while reading, print it
    return; % Exit the function
end
i = fscanf(f, '%g %g', [2 inf]);
fclose(f);

i = i + 1;

S = sparse(i(1, :), i(2, :), 1, matrixSize, matrixSize);
S = S';
% Construct the sparse matrix

[~, col] = size(S);
% Get the number of cols in the sparse matrix

for index = 1 : col
    temp = sum(S(:, index));
    if temp == 0
        temp = 1 / matrixSize;
        S(:, index) = temp;
    else
        fraction = 1 / temp;
        S(S(:, index) == 1) = fraction;
    end
    % Replace the values in the sparse matrix to 1/n
    % where n is the nonzero elements in each column
    % But it seems that this algorithm is not so efficient
end

% PAGERANK HERE
V = zeros(col, 1);
V = V + 1 / col;

r = 0;
while ((abs(r - V)) >= delta)
    r = V;
    V = S * V;
end