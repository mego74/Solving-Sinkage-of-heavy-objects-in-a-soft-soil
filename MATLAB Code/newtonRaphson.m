function [k, iter, relativeErrors] = newtonRaphson(k, r, p, err, method)
    % Perform Newton-Raphson iterations
    maxIter = 100;
    iter = 0;
    relativeErrors = zeros(maxIter, 3);

    while iter < maxIter
        % Calculate the function values and Jacobian matrix
        F = calculateF(k, r, p);
        J = calculateJacobian(k, r);

        % Solve the linear system
        if method == 1
            delta_k = gaussElimination(J, -F);
        else
            delta_k = gaussJordan(J, -F);
        end

        % Update the constants
        k = k + delta_k;

        % Calculate the relative errors
        relativeErrors(iter+1, 1) = abs(delta_k(1) / k(1));
        relativeErrors(iter+1, 2) = abs(delta_k(2) / k(2));
        relativeErrors(iter+1, 3) = abs(delta_k(3) / k(3));

        % Check for convergence
        if all(relativeErrors(iter+1, :) < (err/100))
            break;
        end

        iter = iter + 1;
    end

    % Set iter to -1 if convergence was not achieved
    if iter == maxIter
        iter = -1;
    end
end