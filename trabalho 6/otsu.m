%Otsu
clear all;
close all;

RGB = im2double(imread('carcinoma_in_situ/carcinoma (1).BMP'));

%Converte em tons de cinzas por média artimética
I = gray_mean(RGB);
imshow(I)

%Segmenta a imagem
level = graythresh(I);
BW = im2bw(I,level);
BW = ~BW;
figure;
imshow(BW)


MASK = imread('carcinoma_in_situ_mascaras/carcinoma (1)_mascara_juncao.bmp');
figure;
imshow(MASK);

POS = nnz(MASK);
NEG = numel(MASK)- POS;

TP = nnz(MASK&BW);
FP = nnz(MASK|BW) - POS;
TN = NEG - FP;
FN = nnz(MASK) - TP;

precision = TP/(TP+FP);
recall = TP/(TP+FN);

dice = 2*nnz(BW&MASK)/(nnz(BW) + nnz(MASK));
