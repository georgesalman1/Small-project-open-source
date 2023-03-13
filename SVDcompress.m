% Read the image
img = imread('original_image.png');
figure;
imshow(img);
title('Original Image');

% Convert image to grayscale
gray_img = rgb2gray(img);

% Perform SVD on the image
[U, S, V] = svd(double(gray_img));

% Set the number of singular values to keep for compression
num_singvals = 50;

% Truncate SVD matrices
U_tilde = U(:, 1:num_singvals);
S_tilde = S(1:num_singvals, 1:num_singvals);
V_tilde = V(:, 1:num_singvals);

% Reconstruct the compressed image
compressed_img = uint8(U_tilde * S_tilde * V_tilde');

% Display the compressed image
figure;
imshow(compressed_img);
title('Compressed Image');

% Calculate compression ratio
original_size = numel(gray_img);
compressed_size = numel(U_tilde) + numel(S_tilde) + numel(V_tilde);
compression_ratio = compressed_size / original_size;
disp(['Compression Ratio: ' num2str(compression_ratio)]);
