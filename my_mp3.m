% MP3 description
fprintf("This script plots the periodic function f(x) and its " + ...
    "Fourier series partial sum.\nf(x) = +k, when –pi < x < 0\n" + ...
    "f(x) = -k, when 0 < x < pi\n\n")

% Prompting the user to select the amplitude parameter, k
k = "a";
while not(isnumeric(k))
    k = input("Enter the amplitude parameter, k: ");
    if not(isnumeric(k))
        fprintf("Invalid input. Must be a number.\n");
    end
end

% Prompting the user to select the number of sinusoids to add
sines = "a";
while not(isnumeric(sines)) || sines < 1
    sines = input("Enter number of sinusoids to add: ");
    if not(isnumeric(sines)) || sines < 1
        fprintf("Invalid input. Must be a number not less than 1.\n");
    end
end

% Create x value vector from -pi to pi with equal intervals of 2pi/100
% Will return 101 elements
x = -pi:(2*pi)/100:pi;

% Create vector for f(x) or y values for each x value (there are 101)
fx = [k*ones(1,50), 0, -k*ones(1,50)];

% Get (sine)th partial sum of the fourier series found in the main document
psum = zeros(1, 101); % Initialize (sine)th partial sum with zeros
n = 1; % Initialize n as described in the main document
% Implement sinx + (1/3)sin3x + (1/5)sin5x +... until the given number of 
% sinusoids is reached
for i = 1:sines
    psum = psum + ((1/n) * sin(n*x));
    n = n + 2; % Skip over the even values of n, which equal 0
end

% Multiply the sinx + (1/3)sin3x + (1/5)sin5x +... with -4k/pi to complete
% the partial sum
psum = (-4*k/pi) * psum;

% Plot f(x) and its Fourier series partial sum superimposed over it
plot(x, fx);
hold on; % allows psum plot to be superimposed over fx plot
plot(x, psum);
hold off;






