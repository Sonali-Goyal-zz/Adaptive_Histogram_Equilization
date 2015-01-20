
function [ output ] = histogram( I, n, g_min, g_max )

% Setup.
output = zeros(n,1);
range = (g_max - g_min) / (n - 1);

[width height] = size(I);

% Iterate over entire image.
for i=1:width
    for j=1:height
        v = I(i, j);
        % If it's out of range, throw it away.
        if ( v < g_min || v > g_max )
            continue;
        end

        % Store it in its appropriate bin.
        new_val = floor(double((v - g_min)) / range) + 1;
        output(new_val) = output(new_val) + 1;
    end
end

% Scale outputs to 0.0 - 1.0 range.
output = output / (width * height);
