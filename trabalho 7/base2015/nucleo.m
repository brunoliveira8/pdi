close all;
clear all;
clc;

mask_path = 'clups/clup_mask-';
img_path = 'imagens/isbi2015/training_r1_01dec2014/training/EDF/frame004.png';
result = im2bw(zeros([256 256]));
Y = imread(img_path);
Y = imresize(Y, 0.250);


for x = 1:9
    mask = imread(strcat(mask_path, int2str(x), '.png'));
    I = uint8(mask).*Y;
    I = medfilt2(I, [3 3]);
    I = imadjust(I);
%     figure;
%     imshow(I)
%     
   
    
    BW = edge(I,'roberts') | edge(I,'sobel');
%     figure;
%     imshow(BW);

    
    [B,L] = bwboundaries(BW,'noholes');
    C = max(max(L));
    if C == 1
        M1 = L == 1;
        M1 = imfill(M1, 'holes');
        M1 = bwareaopen(M1, 20);
        result = result | M1;
    else
        for i = 2:C
            M1 = L == i;
            M1 = imfill(M1, 'holes');
            M1 = bwareaopen(M1, 20);
            result = result | M1;
        end
    end
    

end


figure;
imshow(result)