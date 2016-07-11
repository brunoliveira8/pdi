close all;
clear all;
clc;

mask_path = 'clups/mask-4/clup_mask-';
img_path = 'imagens/isbi2014_test/isbi2014_train/orig/isbi_train_im004.png';





for l = 1:45
    
    img_path = 'imagens/isbi2014_test/isbi2014_train/orig/isbi_train_im0';
    mask_path = strcat('clups/mask-',int2str(l), '/clup_mask-');
    
    if l < 10
        Y = imread(strcat(img_path, '0',int2str(l), '.png'));
    else
         Y = imread(strcat(img_path,int2str(l), '.png'));
    end
    result = im2bw(zeros([512 512]));
    
    D = dir(strcat('clups/mask-',int2str(l)));
    n_masks = size(D)-2;
    
    for x = 2:n_masks
        mask = imread(strcat(mask_path, int2str(x), '.png'));
        I = uint8(mask).*Y;
        I = medfilt2(I, [7 7]);
        I = imadjust(I);
        
        BW = edge(I,'roberts') | edge(I,'sobel');

        [B,L] = bwboundaries(BW,'noholes');
        C = max(max(L));
        
        for i = 2:C
            M1 = L == i;
            M1 = imfill(M1, 'holes');
            M1 = bwareaopen(M1, 20);
            result = result | M1;
        end
    end
    result = bwareaopen(result, 100);
    imwrite(result, strcat('seg/', 'isbi_train_im0',int2str(l), '.png'))
end