%Fuzzy C-means
clc;
clear all;
close all;
tic;

samples = 70;

folder = 'normal_intermediate/normal_intermediate (';
mask_folder = 'normal_intermediate_mascaras/normal_intermediate (';

precision = zeros(samples,1);
recall = zeros(samples,1);
dice = zeros(samples,1);

for i=1:samples
    
    file = strcat(folder, int2str(i), ').BMP');
    RGB = im2double(imread(file));
    
    %Converte em tons de cinzas por m�dia artim�tica
    I = gray_mean(RGB);
%     imshow(I)
    
    % Segmenta a imagem
    [BW, level] = fcmthresh(I);
    BW = ~BW;
%     figure;
%     imshow(BW)
    
    mask_file = strcat(mask_folder, int2str(i), ')_mascara_nucleo.BMP');
    MASK = imread(mask_file);
%     figure;
%     imshow(MASK);
    
    POS = nnz(MASK);
    NEG = numel(MASK)- POS;
    
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