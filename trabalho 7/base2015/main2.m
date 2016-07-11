%Trabalho final
close all;
clear all;
clc;

img_path = 'imagens/isbi2015/training_r1_01dec2014/training/EDF/frame004.png';

I = imread(img_path);
% I = imresize(I, 0.0625);
I = imresize(I, 0.250);


figure;
imshow(I)

I = medfilt2(I, [3 3]);
I = imadjust(I);
% figure;
% imhist(I)

%Fuzzy C-means
BW = fcmthresh(im2double(I));
BW = ~BW;
BW = bwareaopen(BW, 20);
% BW = imfill(BW,'holes');
figure;
imshow(BW)
% 
% figure;
% imshow(BW1);

L = bwlabel(BW);
C = max(max(L));

% for i = 1:C
%     M1 = L == i;
%     FILTER = uint8(M1).* I;
%     FILTER(FILTER == 0) = 255;
%     
%     %FILTER = histeq(FILTER);
%     
%     %FCMEANS
%     %BW1 = fcmthresh(im2double(FILTER));
%     
%     %RENYI
%     %level1 = renyi_threshold(FILTER);
%     %BW1 = im2bw(FILTER,level1(1));
%     
%     %OTSU
%     level1 = graythresh(FILTER);
%     BW1 = im2bw(FILTER,level1);
%     
%     imwrite(M1, strcat('clups/clup_mask-', int2str(i), '.png'))
%     
% %     figure;
% %     imshow(FILTER)
%     %figure;
%     %imshow(BW1)
% end