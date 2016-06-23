%K-mean
clc;
clear all;
close all;
tic;

samples = 70;
folder = 'carcinoma_in_situ/carcinoma (';
mask_folder = 'carcinoma_in_situ_mascaras/carcinoma (';

precision = zeros(samples,1);
recall = zeros(samples,1);
dice = zeros(samples,1);

for i = 1:samples

    file = strcat(folder, int2str(i), ').BMP');
    RGB = im2double(imread(file));
    
    %Converte em tons de cinzas por média artimética
    I = gray_bloch(RGB);
%     imshow(I)
    
    %Segmenta a imagem
    [nrows, ncols] = size(I);
    aux = double(reshape(I, nrows*ncols,1));
    idx = kmeans(aux, 2);
    BW = reshape(idx,nrows,ncols)-1;
    BW = im2bw(BW);
%     figure;
%     imshow(BW);
    
    mask_file = strcat(mask_folder, int2str(i), ')_mascara_nucleo.BMP');
    MASK = imread(mask_file);
    
%     figure;
%     imshow(MASK);
    
    
    POS = nnz(MASK);
    NEG = numel(MASK)- POS;
    
    if (nnz(BW) - POS) < (nnz(~BW) - POS)
        BW = ~BW;
    end
    
    TP = nnz(MASK&BW);
    FP = nnz(MASK|BW) - POS;
    TN = NEG - FP;
    FN = nnz(MASK) - TP;
    
    precision(i) = TP/(TP+FP);
    recall(i) = TP/(TP+FN);
    dice(i) = 2*nnz(BW&MASK)/(nnz(BW) + nnz(MASK));
end

dice_mean = mean(dice)
precision_mean = mean(precision)
recall_mean = mean(recall)

dice_std = std(dice)
precision_std = std(precision)
recall_std = std(recall)

toc;