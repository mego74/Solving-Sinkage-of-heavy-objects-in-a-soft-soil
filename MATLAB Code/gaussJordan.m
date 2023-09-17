function x = gaussJordan(A, b)
    % Naïve Gauss-Jordan method
    % A: coefficient matrix
    % b: right-hand side vector

    n = size(A, 1); % Get the number of rows in matrix A (assuming A is square)

    Ab = [A, b]; % Combine matrix A and vector b to form the augmented matrix Ab

    % Forward elimination
    for k = 1:n
        Ab(k, :) = Ab(k, :) / Ab(k, k); % Normalize the pivot row

        for i = 1:n
            if i ~= k
                factor = Ab(i, k); % Get the factor to eliminate the entry in column k of row i
                Ab(i, :) = Ab(i, :) - factor * Ab(k, :); % Subtract a multiple of the pivot row from row i to eliminate the entry
            end
        end
    end

    x = Ab(:, n+1); % Extract the rightmost column of Ab as the solution vector x
end
