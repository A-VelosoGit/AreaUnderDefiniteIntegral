% MP2 description
fprintf("This script employs Euler's method to solve the " + ...
    "differential equation\ndy/dx+y=2x.\n\n")

% Prompting the use to select initial condition for x
init_x = "a";
while not(isnumeric(init_x))
    init_x = input("Enter initial condition value for x: ");
    if not(isnumeric(init_x))
        fprintf("Invalid input. Must be a number.\n");
    end
end

% Prompting the use to select initial condition for y
init_y = "a";
while not(isnumeric(init_y))
    init_y = input("Enter initial condition value for y: ");
    if not(isnumeric(init_y))
        fprintf("Invalid input. Must be a number.\n");
    end
end

% Prompting the use to select the lower limit for x
low_x = "a";
while not(isnumeric(low_x)) || low_x < init_x
    low_x = input("Enter the lower limit for x range: ");
    if not(isnumeric(low_x)) || low_x < init_x
        fprintf("Invalid input. Must be number greater than or equal to initial value for x.\n");
    end
end

% Prompting the use to select the upper limit for x
hi_x = "a";
while not(isnumeric(hi_x)) || hi_x <= low_x
    hi_x = input("Enter the upper limit for x range: ");
    if not(isnumeric(hi_x)) || hi_x <= low_x
        fprintf("Invalid input. Must be number greater than lower limit.\n");
    end
end

% Prompting the interval between x values
% Step size must be divisible to the space between the upper limit and the
% initial condition of x
step_size = "a";
while not(isnumeric(step_size)) || not(mod((hi_x - init_x), step_size) == 0)
    step_size = input("Enter the interval or step size: ");
    if not(isnumeric(hi_x)) || not(mod((hi_x - init_x), step_size) == 0)
        fprintf("Invalid input.\n");
    end
end

% Create an array for x values
x = init_x:step_size:hi_x;

% Create an array consisting of the true 
% y values from the analytical solution
true_y = 2.*x - 2 + 3*exp(1).^-x;

% Create an array consisting of the y values found using the Euler method.
% First create zero array to prevent the array from changing size with each
% iteration and slowing down the program
euler_y = zeros(1, length(x));
% Get initial value for euler_y
euler_y(1) = init_y;
% Iterate Euler's method from after the initial value to the final value.
for i=2:1:length(euler_y)
    euler_y(i) = euler_y(i-1) + step_size*(2*x(i-1) - euler_y(i-1));
end

% Create an array consisting of the percent relative error between the true
% y value and the euler y value at the same x
error_x = abs((true_y - euler_y) ./ true_y .* 100);

% Transpose arrays to make them row vectors for the tabulation.
x = x';
true_y = true_y';
euler_y = euler_y';
error_x = error_x';

% Find the index of the lower limit
k = find(x==low_x);

% Tabulate the x values, true y values, euler y values, and the percent
% relative errors computed within the range.
t = table(x(k:end), true_y(k:end), euler_y(k:end), error_x(k:end), 'VariableNames', {'x', 'true_y', 'euler_y', 'error_x'});

% Display table
disp(t);

% Plot true solution and euler solution within limits
% Also sets true solution line to blue and euler solution line to black
plot(x(k:end), true_y(k:end), 'blue', x(k:end), euler_y(k:end), 'black');

% Sets background color to light blue
set(gca, 'Color', [0.5843 0.8157 0.9882]);

% Sets the labels of each line
legend('true solution', 'euler solution');