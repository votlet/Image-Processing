addpath('C:\Users\virgi\Documents\UCL\Q9\Image processing\Depth From Blur\toolbox_signal\toolbox_signal')
addpath('C:\Users\virgi\Documents\UCL\Q9\Image processing\Depth From Blur\toolbox_general')
addpath('C:\Users\virgi\Documents\UCL\Q9\Image processing\Depth From Blur\toolbox_wavelet_meshes');

% Gaussian kernel with sigma = 3
x0 = load_image('C:\Users\virgi\Documents\UCL\Q9\Image processing\Depth From Blur\DFB_artificial_dataset\im0_original');
y0 = load_image('C:\Users\virgi\Documents\UCL\Q9\Image processing\Depth From Blur\DFB_artificial_dataset\im0_blurry');
ySp0 = inverse_prob(y0,1,3);

figure(1)
subplot(2,2,1)
imageplot(y0)
title('Blurry image')
subplot(2,2,2)
imageplot(ySp0)
title('Deblured image')
subplot(2,2,3)
imageplot(ySp0-y0)
title('Deblured image - blurry image')
subplot(2,2,4)
imageplot(x0-ySp0)
title('Error between original and deblured images')

% % Gaussian kernel, sigma = 5
% x1 = load_image('C:\Users\virgi\Documents\UCL\Q9\Image processing\Depth From Blur\DFB_artificial_dataset\im1_original');
% y1 = load_image('C:\Users\virgi\Documents\UCL\Q9\Image processing\Depth From Blur\DFB_artificial_dataset\im1_blurry');
% ySp1 = inverse_prob(y1,1,5);
% 
% figure(2)
% subplot(2,2,1)
% imageplot(y1)
% title('Blurry image')
% subplot(2,2,2)
% imageplot(ySp1)
% title('Deblured image')
% subplot(2,2,3)
% imageplot(ySp1-y1)
% title('Deblured image - blurry image')
% subplot(2,2,4)
% imageplot(x1-ySp1)
% title('Error between original and deblured images')
% 
% % Circular kernel, r = 6
% x2 = load_image('C:\Users\virgi\Documents\UCL\Q9\Image processing\Depth From Blur\DFB_artificial_dataset\im2_original');
% y2 = load_image('C:\Users\virgi\Documents\UCL\Q9\Image processing\Depth From Blur\DFB_artificial_dataset\im2_blurry');
% ySp2 = inverse_prob(y2,2,6);
% 
% figure(3)
% subplot(2,2,1)
% imageplot(y2)
% title('Blurry image')
% subplot(2,2,2)
% imageplot(ySp2)
% title('Deblured image')
% subplot(2,2,3)
% imageplot(ySp2-y2)
% title('Deblured image - blurry image')
% subplot(2,2,4)
% imageplot(x2-ySp2)
% title('Error between original and deblured images')
