%Cyto Circles
clear all;
close all;
clc;

path_gt = 'imagens/isbi2014_test/isbi2014_train/gt/Cyto/im';
path_seg = 'seg/im-';
cell_aux = [];
bg = logical(zeros(512));
count =1;
r = [];
display('Calculando raio medio');
for i=3:3
    n_im = length(dir(strcat(path_gt,int2str(i))))-2;
    clear cell_aux;
    cell_aux = [];
    for l=1:n_im
        im = imread(strcat(path_gt,int2str(i),'/im_', sprintf('%03d', l), '.png' ));
        %figure, imshow(im);

        ch = bwconvhull(im);
        %figure, imshow(ch);

        s = regionprops(im,'MajorAxisLength', 'Centroid');

        %shapeInserter = vision.ShapeInserter('Shape', 'Circles','BorderColor', 'White','Fill', true, 'FillColor', 'White', 'Opacity', 1);
        shapeInserter = vision.ShapeInserter('Shape', 'Circles','BorderColor', 'White');
        y = step(shapeInserter, ch, int32([s.Centroid(1) s.Centroid(2) s.MajorAxisLength/2]));
        figure, imshow(y);
        imwrite(y, strcat('chcell-', int2str(l), '.png'));

        s1 = regionprops(y,'MajorAxisLength');

        r(count) = s1.MajorAxisLength/2;
        count = count+1;

    end

end

% r_mean = mean(r);
% 
% clc;
% 
% display('Salvando imagens');
% for u=3:3
%     
%     nucleo_path = strcat('nucleos/isbi_train_im0',int2str(u),'.png');
%     %mkdir(strcat(path_seg,int2str(u)));
%     
%     nucleo = imread(nucleo_path);
%     
%     s = regionprops(nucleo,'Centroid');
%     centroids = cat(1, s.Centroid);
%     num_nucleo = size(centroids);
%     num_nucleo = num_nucleo(1);
%     %centroids = round(centroids);
%     
%     count = 1;
%     for m=1:num_nucleo
%         shapeInserter = vision.ShapeInserter('Shape', 'Circles','BorderColor', 'White','Fill', true, 'FillColor', 'White', 'Opacity', 1);
%         BW = step(shapeInserter, bg, int32([centroids(m,1) centroids(m,2) r_mean]));
%         %imwrite(BW, strcat(path_seg,int2str(u),'/cell-', int2str(count), '.png'))
%         figure, imshow(BW);
%         count = count+1;
%         
%     end
% end
% clc;
% display('Pronto!')
