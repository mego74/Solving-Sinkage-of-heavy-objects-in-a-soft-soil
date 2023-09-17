function predictPlateSize(k)
    % Prompt the user to ask if they want to predict the lowest size of a circular plate
    predict = input('Do you want to predict the lowest size of a circular plate? (y/n): ', 's');
    
    if lower(predict) == 'y'
        % Get the load (F) from the user
        F = input('Enter the load (F) in kN: ');

        % Bisection method to find radius
        a = 0.000001;  % Initial guess for smallest radius
        b = 40;  % Initial guess for largest radius
        
        % Evaluate the function at the initial guesses
        p_a = k(1)*exp(k(2)*a) + k(3)*a;
        A_a = pi * a^2;
        F_estimated_a = p_a * A_a - F;
        
        p_b = k(1)*exp(k(2)*b) + k(3)*b;
        A_b = pi * b^2;
        F_estimated_b = p_b * A_b - F;
        
        % Check if the initial guesses result in sinkage less than or equal to the specified maximum
        if F_estimated_a > 0 || F_estimated_b < 0
            fprintf('The initial guesses do not bracket the solution. Please provide different initial guesses.\n');
            return;
        end
        
        % Bisection loop
        while b - a > 0.00001
            r = (a + b) / 2;
            p = k(1)*exp(k(2)*r) + k(3)*r;
            A = pi * r^2;
            F_estimated = p * A - F;
            
            if F_estimated > 0
                b = r;
            else
                a = r;
            end
        end
        
        fprintf('\nThe lowest size of a circular plate required to sustain a load of %.4f kN is:\n', F);
        fprintf('Radius = %.5f m\n', r);
    end
end
