close all;
clear all;
clc;

mask_path = 'clups/clup_mask-3.png';
img_path = 'imagens/isbi2015/training_r1_01dec2014/training/EDF/frame004.png';
I = imread(img_path);
I = imresize(I, 0.250);

M = imread(mask_path);
Y = I.*uint8(M);

figure, imshow(Y);

A = imadjust(Y);

A = im2double(A);

figure, imshow(A);
count = imhist(A);
figure,plot(count(2:end));

% BW = fcmthresh(A);

% level = graythresh(A);
% BW = im2bw(A,level);

% level = renyi_threshold(A);
% BW = im2bw(A,level(1));
% BW = ~BW;



