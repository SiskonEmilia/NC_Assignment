a = 0;
b = 1;
h = 0.1;
y0 = 1;
delta = 0.000001;
xs = a + h : h : b;

fys = ForwardEuler(@TargetFunction, a, b, h, y0);
bys = BackwardEuler(@TargetFunction, a, b, h, y0, delta);
tys = Trapezoidal(@TargetFunction, a, b, h, y0, delta);
iys = ImprovedEuler(@TargetFunction, a, b, h, y0);
rys = ReferenceFunction(xs);

figure();
hold on;
plot(xs, fys);
plot(xs, bys);
plot(xs, tys);
plot(xs, iys);
plot(xs, rys);
legend('Forward Euler', 'Backward Euler', 'Trapezoidal', 'Improved Euler', 'Reference');
hold off;