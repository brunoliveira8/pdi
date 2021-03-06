close all;
clear all;
clc;

for u=9:9
    
    img_path = strcat('imagens/isbi2014_test/isbi2014_train/orig/isbi_train_im0',sprintf('%02d',u),'.png');
    nucleo_path = strcat('nucleos/isbi_train_im0',int2str(u),'.png');
    clups = length(dir(strcat('clups/mask-', int2str(u))))- 2;
    
    %mkdir(strcat('cyto/im-',int2str(u)));
    
    nucleo = imread(nucleo_path);
    
    Y = imread(strcat(img_path));
%     figure,imshow(Y);

    s = regionprops(nucleo,'centroid');
    centroids = cat(1, s.Centroid);
    centroids = round(centroids);
    
    for f=1:clups
        mask_path = strcat('clups/mask-', int2str(u),'/clup_mask-', int2str(f),'.png');
        
        result = im2bw(zeros([512 512]));
        mask = imread(strcat(mask_path));
        
        I = uint8(mask).*Y;
        I = medfilt2(I, [7 7]);
        I = imadjust(I);
        
        % figure,imshow(I);
        
        BW = edge(I,'roberts') | edge(I,'sobel');
        BW = bwareaopen(BW, 20);
        
        BW1 = imfill(BW, 'holes');
        
        CH = bwconvhull(BW1);
        
        %Por Concavidade
        BD1 = edge(BW1,'roberts');
        BD2 = edge(CH,'roberts');
        BD3 = BD1 | BD2;
        
        imwrite(BD3, 'contorno1.png')
        
        
        B1 = bwboundaries(BW1);
        B1 = B1{1};
        B2 = bwboundaries(CH);
        B2 = B2{1};
        dist = zeros([length(B1) 1]);
        
        for i=1:length(B1)
            dist1 = sqrt((B2(:,1)-B1(i,1)).^2 + (B2(:,2) - B1(i,2)).^2);
            dist(i) = min(dist1);
        end
        
        figure, plot(dist)
        
        size_centroids = size(centroids);
        num_nucleo = size_centroids(1);
        p = zeros([num_nucleo 2]);
        aux_mat = dist;
        
        for l=1:num_nucleo
            aux = find(aux_mat == max(aux_mat));
            
            p(l, :) = B1(aux(1), :);
            left = aux(1)-50;
            if left < 1
                left = 1;
            end
            
            right = aux(1)+50;
          
            aux_mat(left:right) = 0;
        end
        
        % figure,imshow(BD3);
        
        
        
        for l=1:num_nucleo-1
            y1 = p(l,1);
            x1 = p(l,2);
            y2 = p(l+1, 1);
            x2 = p(l+1, 2);
            
            shapeInserter = vision.ShapeInserter('Shape', 'Lines');
            y = step(shapeInserter, BW1, int32([x1 y1 x2 y2]));
            
            BW1 = y;
            
        end
        figure, imshow(y);
        imwrite(y,'segmented1.png');
        
        BD4 = edge(BW1,'roberts');
        
        BW2 = bwmorph(BD4,'close');
        % figure, imshow(BW2);
        count = 1;
        for m=1:num_nucleo
            BW3 = imfill(BW2, [centroids(m,2) centroids(m,1)]);
            %     figure, imshow(BW3)
            
            BW4 = bwmorph(BW3, 'majority');
            BW4 = bwmorph(BW4, 'majority');
            BW5 = bwareaopen(BW4, 100);
            if nnz(BW5) < 131072
                %imwrite(BW5, strcat('cyto/im-',int2str(u),'/cell-', int2str(count), '.png'))
                count = count+1;
            end
        end
    end
end




