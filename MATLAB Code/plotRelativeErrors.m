function plotRelativeErrors(relativeErrors, iter)
    % Plot the relative errors
    iterations = 1:iter;
    
    figure;
    plot(iterations, relativeErrors(iterations, 1), 'ro-', 'DisplayName', 'Relative Error in k1');
    hold on;
    plot(iterations, relativeErrors(iterations, 2), 'go-', 'DisplayName', 'Relative Error in k2');
    plot(iterations, relativeErrors(iterations, 3), 'bo-', 'DisplayName', 'Relative Error in k3');
    hold off;
    xlabel('Number of Iterations');
    ylabel('Relative Error');
    legend('Location', 'Best');
    title('Relative Error in Estimating the Constants');
end
