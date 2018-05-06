function X = Conjugate_Gradient(A, b, x0, times)

X = x0;
r = b - A * x0;
p = r;
[row, ~] = size(A);

if times > row
    'The times you set might be too large...'
end

for counter = 1 : times

    temp = dot(p, A * p);

    if temp == 0
        break;
    end

    a = dot(r, r) / temp;
    X = X + a * p;
    tempr = r - a * A * p;
    Beta = dot(tempr, tempr) / dot(r, r);
    r = tempr;
    p = r + Beta * p;
end