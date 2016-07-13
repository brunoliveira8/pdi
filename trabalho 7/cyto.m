close all;
clear all;
clc;

img_path = 'imagens/isbi2014_test/isbi2014_train/orig/isbi_train_im007.png';
mask_path = strcat('clups/mask-7/clup_mask-2.png');
nucleo_path = 'nucleos/isbi_train_im07.png';

nucleo = imread(nucleo_path);
s = regionprops(nucleo,'centroid');
centroids = cat(1, s.Centroid);
centroids = round(centroids);




Y = imread(strcat(img_path));

% figure,imshow(Y);

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


B1 = bwboundaries(BW1);
B1 = B1{1};
B2 = bwboundaries(CH);
B2 = B2{1};
dist = zeros([length(B1) 1]);

for i=1:length(B1)
    dist1 = sqrt((B2(:,1)-B1(i,1)).^2 + (B2(:,2) - B1(i,2)).^2);
    dist(i) = min(dist1);
end


num_nucleo = 2;
p = zeros([1 num_nucleo]);
aux_mat = dist;

for l=1:num_nucleo    
    aux = find(aux_mat == max(aux_mat));
    
    p(l) = aux(1);
    
    aux_mat(p(l)-50:p(l)+50) = 0;
end

% figure,imshow(BD3);

y1 = B1(p(1), 1);
x1 = B1(p(1), 2);
y2 = B1(p(2), 1);
x2 = B1(p(2), 2);

shapeInserter = vision.ShapeInserter('Shape', 'Lines');
y = step(shapeInserter, BW1, int32([x1 y1 x2 y2]));

BD4 = edge(y,'roberts');

BW2 = bwmorph(BD4,'close');
figure, imshow(BW2);
max = size(centroids);
for m=1:max(1)
    BW3 = imfill(BW2, [centroids(m,1) centroids(m,2)]);
    figure, imshow(BW3)
    
    BW4 = bwmorph(BW3, 'majority');
    BW4 = bwmorph(BW4, 'majority');
    BW5 = bwareaopen(BW4, 100);
    
%     figure, imshow(BW5);
end






