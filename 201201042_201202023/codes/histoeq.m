% histoeq
%
%  Takes an Image I and creates a histogram with n bins
%  along the range of min to max (inclusive), and performs
%  histogram equalization on the image.
%
%  An optional parameter alpha can be supplied to blend
%  between the original histogram and the equalized histogram.


function [ out ] = histoeq( I, n, min, max, alpha )

% Set to full if option not provided.
if nargin < 5
    alpha = 1;
end

% Calculate histogram (pdf).
step = (max - min) / (n - 1);
p = histogram( I, n, min, max );

% Generate cdf from pdf.  Scale by N-1 at same time.
s = size(n,1);
s(1) = (n-1) * p(1);
for i=2:n
    s(i) = s(i-1) + (n-1) * p(i);
end

% Floor values.
s = floor(s);

% Iterate over image and create scaled image.
[width height] = size(I);
out = zeros(width, height);
for i=1:width
    for j=1:height
        % Index of cdf.
        idx = floor(double((I(i, j) - min)) / step) + 1;

        % Interpolate image.
        out(i, j) = alpha * s(idx) + (1 - alpha) * I(i,j);
    end
end

% Scale back down to a viewable range.
out = out / (n - 1);


end

