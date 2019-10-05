% 2-D Transform
% The 2-D Fourier transform is useful for processing 2-D signals and other 2-D data such as images.
% Create and plot 2-D data with repeated blocks.

P = peaks(20);
X = repmat(P,[5 10]);
imagesc(X)

% TODO : Compute the 2-D Fourier transform of the data.  
% Shift the zero-frequency component to the center of the output, and 
% plot the resulting 100-by-200 matrix, which is the same size as X.
signal_fft = fft2(X);
signal_fft_2 = fft2(X, 2^nextpow2(100),2^nextpow2(200));
centered_signal_fft = fftshift(signal_fft_2);
imagesc(abs(centered_signal_fft));