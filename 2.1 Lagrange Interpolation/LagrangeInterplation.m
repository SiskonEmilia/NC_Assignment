function [result] = LagrangeInterplation(xs, ys, tarx, calPower)
    numerators = ones(1, calPower + 1) * tarx;
    numerators = numerators - xs;
    result = 0;

    for k = 1 : calPower + 1
        numerator = 1;
        denominator = 1;
        for index = 1 : k - 1
            numerator = numerator * numerators(1, index);
            denominator = denominator * (xs(1, k) - xs(1, index));
        end

        for index = k + 1 : calPower + 1
            numerator = numerator * numerators(1, index);
            denominator = denominator * (xs(1, k) - xs(1, index));
        end
        result = result + ys(1, k) * numerator / denominator;
    end
end

