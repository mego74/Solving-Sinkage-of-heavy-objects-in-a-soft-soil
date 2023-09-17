function plotPressureVsRadius(k, r, p)
    % Generate a range of radius values
    r_range = linspace(min(r), max(r), 100);

    % Calculate the corresponding pressure values using the fitted curve
    p_range = k(1) * exp(k(2) * r_range) + k(3) * r_range;

    % Plot the data points and the fitted curve
    figure;
    plot(r, p, 'ro', 'DisplayName', 'Data Points');
    hold on;
    plot(r_range, p_range, 'b-', 'DisplayName', 'Fitted Curve');
    hold off;

    % Set the axis labels and title
    xlabel('Radius');
    ylabel('Pressure');
    legend('Location', 'Best');
    title('Pressure as a Function of Radius');
end
