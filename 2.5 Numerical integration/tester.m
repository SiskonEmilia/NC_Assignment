syms x;
s = sin(x) / x;
targetValue = double(int(s, [0, 1]));
ys = ones(1, 4) * targetValue;
ys1 = ones(1, 4);
ys2 = ones(1, 4);
toTest = [5 9 17 33];
for index = 1 : 4
    N = toTest(1, index);
    ys1(1, index) = CompoundTrapezoidal(@TargetFunction, toTest(1, index), 0, 1); 
    ys2(1, index) = CompoundSimpson(@TargetFunction, toTest(1, index), 0, 1);
end

figure();
hold on;
plot(toTest, ys);
plot(toTest, ys1);
plot(toTest, ys2);
legend('Reference', 'Compound Trapezoidal', 'Compound Simpson');
hold off;