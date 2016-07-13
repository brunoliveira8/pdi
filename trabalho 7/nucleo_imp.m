% Eliminar pedaços que não são núcleo
clc;
clear all;
close all;


for l = 1:45
    
    img_path = 'seg_renyi/isbi_train_im0';
    

    I = imread(strcat(img_path,int2str(l), '.png'));



    [L num] = bwlabel(I);

    FILTER = zeros(size(I));

    for i=1:num
        N = L == i;
        stats = regionprops(N, 'Area', 'Perimeter');

        P = stats.Perimeter;
        A = stats.Area;
        c = P^2 / (4 * pi* A);

        if c < 1.5;
            FILTER = FILTER | N;
        end
        
        imwrite(FILTER, strcat('seg/', 'isbi_train_im0',int2str(l), '.png'))
    end


end