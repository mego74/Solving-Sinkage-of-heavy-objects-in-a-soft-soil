function main()
    % Prompts the user for inputs
    r = input('Enter radii (r1, r2, r3) in the format [r1, r2, r3]: ');
    p = input('Enter pressures (p1, p2, p3) in the format [p1, p2, p3]: ');
    err = input('Enter the stopping criterion for Newton-Raphson iterations: ');

    % Choose the method for solving linear systems
    method = input('Choose the method for solving linear systems:\n1. Gauss-Elimination with partial pivoting\n2. Naïve Gauss-Jordan\nEnter the method number: ');

    % Initialize the constants
    k = [40; 5; -100]; % Initial guess for k1, k2, k3

    % Perform Newton-Raphson iterations
    [k, iter, relativeErrors] = newtonRaphson(k, r, p, err, method);

    % Check if convergence was achieved
    if iter == -1
        fprintf('\nNewton-Raphson method did not converge within the specified number of iterations.\n');
        fprintf('Please try a different initial guess or adjust the stopping criterion.\n');
    else
        % Display the results
        fprintf('\nSolution:\n');
        fprintf('k1 = %.4f\nk2 = %.4f\nk3 = %.4f\n', k(1), k(2), k(3));

        % Plot the relative errors
        plotRelativeErrors(relativeErrors, iter);

        % Plot pressure as a function of radius
        plotPressureVsRadius(k, r, p);

        % Prompt the user to predict the lowest size of a circular plate
        predictPlateSize(k);
    end
end
