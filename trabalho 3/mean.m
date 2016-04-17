%Trabalho 3
close all;
clear all;
clc;

img = imread('lena_grayscale.png');
image_size = 512;
img_noise = zeros(image_size,image_size);
img_mean = zeros(image_size,image_size);

amount = 100;



for i = 1:amount
  img_noise(:,:) = imnoise(img,'gaussian');
  img_mean = img_mean + img_noise;
end

img_mean = img_mean ./ amount;

figure;
imshow(img)

figure;
imshow(uint8(img_mean))
