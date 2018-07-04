function X = Conjugate_Gradient(A, b, x0, times)

X = x0;
r = b - A * x0;
p = r;
[row, ~] = size(A);

if times > row
    'The times you set might be too large...'
end

for counter = 1 : times

    temp1 = dot(p, A * p);
    temp2 = dot(r, r);

    if temp1 == 0 || temp2 == 0
        break;
    end

    a = temp2 / temp1;
    X = X + a * p;
    tempr = r - a * A * p;
    Beta = dot(tempr, tempr) / temp2;
    r = tempr;
    p = r + Beta * p;
end