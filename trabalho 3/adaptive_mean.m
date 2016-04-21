%Trabalho 3
close all;
clear all;
clc;

img = imread('lena_grayscale.png');
image_size = 512;
img_noise = imnoise(img,'gaussian');
filter_size = 9;
img_adp_mean = medfilt2(img_noise, [filter_size filter_size]);


figure;
imshow(img)

figure;
imshow(img_adp_mean)
imwrite(img_adp_mean, 'lena9.png')

mse_err = MSE(img, img_adp_mean);

ssimval = ssim(img,img_adp_mean);

pnrs_value = PSNR(img, img_adp_mean);