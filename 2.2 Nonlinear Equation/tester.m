[rsteps1, rtimes1, results1] = Bisection(@TargetFunction, 10, 11);
[rsteps2, rtimes2, results2] = Newton(@TargetFunction, @TargetFunctionDerivative, 10);
[rsteps3, rtimes3, results3] = SimplifiedNewton(@TargetFunction, @TargetFunctionDerivative, 10);
[rsteps4, rtimes4, results4] = Secant(@TargetFunction, 10, 10.1);
results1 = abs((results1 - sqrt(115))/sqrt(115));
results2 = abs((results2 - sqrt(115))/sqrt(115));
results3 = abs((results3 - sqrt(115))/sqrt(115));
results4 = abs((results4 - sqrt(115))/sqrt(115));
figure();
hold on;
plot(rsteps1, results1);
plot(rsteps2, results2);
plot(rsteps3, results3);
plot(rsteps4, results4);
hold off;
legend('Bisection', 'Newton', 'Simplified Newton', 'Secant');
figure();
hold on;
plot(rtimes1, results1);
plot(rtimes2, results2);
plot(rtimes3, results3);
plot(rtimes4, results4);
hold off;
legend('Bisection', 'Newton', 'Simplified Newton', 'Secant');