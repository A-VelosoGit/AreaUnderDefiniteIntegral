% MP1 Description
fprintf("This script computes the area under the curve y=ln(1+x), given\n" + ...
    "the limits ranging between 0 and 5.\n")

% Listing Method Choices
fprintf("Method Choices:\n[1] Trapezoidal rule\n[2] Simpson's rule\n")

% Prompting user to select method
method = 0;
while method ~= 1 && method ~= 2
    method = input("What is your choice? ");
    if method ~= 1 && method ~= 2
        fprintf("Invalid input.\n")
    end
end

% Prints selected method
fprintf("You have selected ")
if method == 1
    fprintf("Trapezoidal rule.\nInside Trapezoidal Rule\n")
elseif method == 2
    fprintf("Simpson's rule.\nInside Simpsons\n")
end

% Prompting user to enter limits
low = -1;
high = 6;
% loop continues until lower limit is inside of the range and less than the
% upper limit
while low < 0 || low > 5 || low > high
    low = input("Enter the lower limit: ");
    if low < 0 || low > 5 || low > high
        fprintf("Invalid limit.\n")
    end
end

% loop continues until upper limit is inside of the range and greater than
% lower limit
while high < 0 || high > 5 || high < low
    high = input("Enter the upper limit: ");
    if high < 0 || high > 5 || high < low
        fprintf("Invalid limit.\n")
    end
end

% Prompting user to enter number of intervals
intervals = 0;
if (method == 1)
    while intervals < 1
        intervals = input("Enter the number of intervals desired: ");
        if intervals < 1
            fprintf("Invalid input.\n");
        end
    end
elseif (method == 2)
    while (intervals < 1 || mod(intervals,2) == 1)
        intervals = input("Enter the number of intervals desired (Interval for Simpson's must be even): ");
        if (intervals < 1 || mod(intervals,2) == 1)
            fprintf("Invalid input.\n");
        end
    end
end

% Getting width of each interval
width = (high - low) / intervals;

% Creates and displays an array from the lower limit to the upper limit,
% with the desired number of intervals
x = low:width:high
y = log(1 + x)

% Compute area under the curve based on selected method
fprintf("The area under the curve for f(x) is ")
if method == 1
    % Use the Trapezoidal rule
    area = width * (0.5 * (y(1)+y(end)) + sum(y(2:end-1)));
elseif method == 2
    % Use the Simpson's rule
    % end - 2 is the last even ordinate since there is an odd number of
    % ordinates. end - 1 is the last odd ordinate.
    area = (1/3) * width * ((y(1)+y(end)) + 4*(sum(y(2:2:end-1))) + 2*(sum(y(3:2:end-2))));
end
fprintf(area + "\n")

% Plot the graph
plot(x,y), title("Plot of f(x)"), grid on, axis equal