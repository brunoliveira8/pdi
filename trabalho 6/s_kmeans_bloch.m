%K-means
clear all;
close all;

RGB = im2double(imread('carcinoma_in_situ/carcinoma (3).BMP'));

%Converte em tons de cinzas por média artimética
I = gray_bloch(RGB);
imshow(I)

%Segmenta a imagem
[nrows, ncols] = size(I);
aux = double(reshape(I, nrows*ncols,1));
idx = kmeans(aux, 2);
BW = reshape(idx,nrows,ncols)-1;
BW = im2bw(BW);
figure;
imshow(BW);

MASK = imread('carcinoma_in_situ_mascaras/carcinoma (3)_mascara_juncao.bmp');
figure;
imshow(MASK);


POS = nnz(MASK);
NEG = numel(MASK)- POS;

if (nnz(BW) - POS) < (nnz(~BW) - POS)
    BW = ~BW;
end

TP = nnz(MASK&BW);
FP = nnz(MASK|BW) - POS;
TN = NEG - FP;
FN = nnz(MASK) - TP;

precision = TP/(TP+FP);
recall = TP/(TP+FN);

dice = 2*nnz(BW&MASK)/(nnz(BW) + nnz(MASK));
