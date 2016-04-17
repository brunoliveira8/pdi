%Trabalho 3
close all;
clear all;
clc;

img = imread('lena_grayscale.png');
image_size = 512;
img_noise = imnoise(img,'gaussian');
filter_size = 5;
img_adp_mean = medfilt2(img_noise, [filter_size filter_size]);


figure;
imshow(img)

figure;
imshow(img_adp_mean)

err = immse(img_adp_mean,img)