%Trabalho 6

RGB = imread('carcinoma_in_situ/carcinoma (1).BMP');
I = rgb2gray(RGB);
figure;
imshow(I);

%Otsu Segmentation
level = graythresh(I);
BW = im2bw(I,level);
figure;
imshow(~BW)

%Entropia de Renyi
% hist = imhist(I);
% figure;
% imshow(~BW)

%K-means segmentation
[nrow, ncol] = size(I);
aux = reshape(I, nrow*ncol,1);
idx = kmeans(aux, 2);
level = ((idx(1)+idx(2))/2)/255;
BW = im2bw(I, level);
figure;
imshow(~BW)

%Region Growing
I1 = uint8(regiongrow3(I, 0.1));


