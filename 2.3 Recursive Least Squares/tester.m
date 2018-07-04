m = 10000;
n = 10;
A = randn(m, n);
b = randn(m, 1);
[rsteps, results] = RLS(A, b, m, n)
targetValue = A' * A \ A' * b

for index = 1 : m
    results(:, index) = results(:, index) - targetValue;
end
results = abs(results);
targetValue = abs(targetValue);
for index = 1 : m
    results(:, index) = results(:, index) ./ targetValue;
end
results = mean(results);
plot(rsteps, results);