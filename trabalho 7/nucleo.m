%Trabalho final
close all;
clear all;
clc;

for l = 1:45
    
    img_path = 'imagens/isbi2014_test/isbi2014_train/orig/isbi_train_im0';
    
    if l < 10
        I = imread(strcat(img_path, '0',int2str(l), '.png'));
    else
         I = imread(strcat(img_path,int2str(l), '.png'));
    end
    
    I = medfilt2(I, [7 7]);
    
    level = renyi_threshold(I);
    BW = im2bw(I,level(1));
 
    BW = ~BW;
    BW = bwareaopen(BW, 100);
    
    imwrite(BW, strcat('seg/', 'isbi_train_im0',int2str(l), '.png'))
end