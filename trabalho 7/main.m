%Trabalho final
close all;
clear all;
clc;


% 
% figure;
% imshow(BW1);


for l = 1:45
    
    img_path = 'imagens/isbi2014_test/isbi2014_train/orig/isbi_train_im0';
    mkdir(strcat('clups/mask-',int2str(l)));
    
    if l < 10
        I = imread(strcat(img_path, '0',int2str(l), '.png'));
    else
         I = imread(strcat(img_path,int2str(l), '.png'));
    end

    I = medfilt2(I, [7 7]);
    
    level = graythresh(I);
    BW = im2bw(I,level);

    BW = ~BW;
    BW = bwareaopen(BW, 200);

    L = bwlabel(BW);
    C = max(max(L));
    
    for i = 1:C
        M1 = L == i;
        imwrite(M1, strcat('clups/mask-',int2str(l),'/clup_mask-', int2str(i), '.png'))
    end
end