function x = gaussElimination(A, b)
    % Gaussian elimination with partial pivoting
    % A: coefficient matrix
    % b: right-hand side vector

    n = size(A, 1); % Get the number of rows in matrix A (assuming A is square)

    Ab = [A, b]; % Combine matrix A and vector b to form the augmented matrix Ab

    % Forward elimination
    for k = 1:n-1
        [~, maxRow] = max(abs(Ab(k:n, k))); % Find the row index of the maximum absolute value in the current column
        maxRow = maxRow + k - 1; % Adjust the row index based on the current iteration
        if maxRow ~= k
            Ab([k, maxRow], :) = Ab([maxRow, k], :); % Swap the current row with the row containing the maximum element
        end

        for i = k+1:n
            factor = Ab(i, k) / Ab(k, k); % Compute the factor to eliminate the entry in column k of row i
            Ab(i, k:n+1) = Ab(i, k:n+1) - factor * Ab(k, k:n+1); % Subtract a multiple of the pivot row from row i to eliminate the entry
        end
    end

    % Back substitution
    x = zeros(n, 1); % Create a column vector of zeros to store the solution
    x(n) = Ab(n, n+1) / Ab(n, n); % Solve for the last variable

    for i = n-1:-1:1
        x(i) = (Ab(i, n+1) - Ab(i, i+1:n) * x(i+1:n)) / Ab(i, i); % Solve for the remaining variables using back substitution
    end
end
