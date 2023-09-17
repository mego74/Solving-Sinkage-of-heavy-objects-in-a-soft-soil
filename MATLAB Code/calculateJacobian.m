function J = calculateJacobian(k, r)
    % Calculates the Jacobian matrix
    J = [exp(k(2)*r(1)), k(1)*r(1)*exp(k(2)*r(1)), r(1);
         exp(k(2)*r(2)), k(1)*r(2)*exp(k(2)*r(2)), r(2);
         exp(k(2)*r(3)), k(1)*r(3)*exp(k(2)*r(3)), r(3)];
end
