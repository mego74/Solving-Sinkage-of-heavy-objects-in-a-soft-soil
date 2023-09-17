function F = calculateF(k, r, p)
    % Calculates the function values
    F = [k(1)*exp(k(2)*r(1)) + k(3)*r(1) - p(1);
         k(1)*exp(k(2)*r(2)) + k(3)*r(2) - p(2);
         k(1)*exp(k(2)*r(3)) + k(3)*r(3) - p(3)];
end
