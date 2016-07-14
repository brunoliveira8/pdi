close all;
clear all;
clc;

for u=1:45
    
    img_path = strcat('imagens/isbi2014_test/isbi2014_train/orig/isbi_train_im0',sprintf('%02d',u),'.png');
    nucleo_path = strcat('nucleos/isbi_train_im0',int2str(u),'.png');
    clups = length(dir(strcat('clups/mask-', int2str(u))))- 2;
    
    mkdir(strcat('cyto2/im-',int2str(u)));
    
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
        
        BW = mask;
        %figure, imshow(BW);
        
        BW1 = imfill(BW, 'holes');
        %figure, imshow(BW1);
        
        CH = bwconvhull(BW);
        %figure, imshow(CH);
        
        
        %Por Concavidade
        BD1 = edge(BW1,'roberts');
        BD2 = edge(CH,'roberts');
        BD3 = BD1 | BD2;
        %figure, imshow(BD3);
        
        
        B1 = bwboundaries(BW1);
        B1 = B1{1};
        B2 = bwboundaries(CH);
        B2 = B2{1};
        dist = zeros([length(B1) 1]);
        
        for i=1:length(B2)
            dist1 = sqrt((B1(:,1)-B2(i,1)).^2 + (B1(:,2) - B2(i,2)).^2);
            dist(i) = min(dist1);
        end
        
        size_centroids = size(centroids);
        num_nucleo = size_centroids(1);
        p = zeros([num_nucleo 2]);
        aux_mat = dist;
        
        for l=1:num_nucleo
            aux = find(aux_mat == max(aux_mat));
            
            p(l, :) = B2(aux(1), :);
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
            y = step(shapeInserter, CH, int32([x1 y1 x2 y2]));
            
            CH = y;
            
        end
        %figure, imshow(y);
        
        BD4 = edge(CH,'roberts');
        
        BW2 = bwmorph(BD4,'close');
        %figure, imshow(BW2);
        count = 1;
        for m=1:num_nucleo
            BW3 = imfill(BW2, [centroids(m,2) centroids(m,1)]);
            %     figure, imshow(BW3)
            
            BW4 = bwmorph(BW3, 'majority');
            BW4 = bwmorph(BW4, 'majority');
            BW5 = bwareaopen(BW4, 100);
            if nnz(BW5) < 131072
                %figure,imshow(BW5);
                imwrite(BW5, strcat('cyto2/im-',int2str(u),'/cell-', int2str(count), '.png'))
                count = count+1;
            end
        end
     end
end




