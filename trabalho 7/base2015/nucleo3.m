close all;
clear all;
clc;

mask_path = 'clups/clup_mask-';
img_path = 'imagens/isbi2015/training_r1_01dec2014/training/EDF/frame004.png';
I = imread(img_path);

% figure;
% imshow(I)

count = imhist(I);
% figure;
% plot(count(1:end-1));


k = find(count == max(count(1:end-1)));
I(I == 255) = k(end);
BW1 = fcmthresh(im2double(I));
level = graythresh(I);
BW = im2bw(I,level);

figure;
imshow(I);

figure;
imshow(~BW);
figure;
imshow(~BW1);