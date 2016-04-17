%Trabalho 3
close all;
clear all;
clc;

img = imread('lena_grayscale.png');
image_size = 512;
img_noise = zeros(image_size,image_size);
img_mean = zeros(image_size,image_size);

amount = 5;



for i = 1:amount
  img_noise(:,:) = imnoise(img,'gaussian');
  img_mean = img_mean + img_noise;
end

img_mean = uint8(img_mean ./ amount);


figure;
imshow(img)

figure;
imshow(uint8(img_mean))
%imwrite(uint8(img_mean),'lena100.png')

mse_err = MSE(img, img_mean);

ssimval = ssim(img,img_mean);

pnrs_value = PSNR(img, img_mean);
