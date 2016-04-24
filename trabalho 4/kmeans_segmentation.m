image = imread('lena_grayscale.png');
map = [0,0,0;0.5,0.5,0.5;1,1,1];

% uso do algoritmo kmeans implementado pelo autor:  Jose Vicente Manjon-Herrera - 2005
% arquivo: kmeans_herrera
% link: http://www.mathworks.com/matlabcentral/fileexchange/8379-kmeans-image-segmentation/content/kmeans.m

[mu,mask]=kmeans_herrera(image,3);
imwrite(mask,map,'kmeans_herrera.png');
figure;
imshow('kmeans_herrera.png');

% uso do algoritmo ADAPTATIVO kmeans implementado pelo autor:  Ankit Dixit - 2014
% arquivo: kmeans_dixit
% link: http://www.mathworks.com/matlabcentral/fileexchange/45057-adaptive-kmeans-clustering-for-color-and-gray-image/content/adaptcluster_kmeans.m

[lb,center] = kmeans_dixit(image);
imwrite(lb,map,'kmeans_dixit.png');
figure;
imshow('kmeans_dixit.png');


