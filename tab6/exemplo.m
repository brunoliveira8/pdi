
clc; clear;

%lendo as imagens
colorImg = imread('tiffany.bmp');
% ref = imread('ref.bmp');

%converte para escala de cinza
grayscaleSS = somaSimetrica(colorImg); 
grayscaleMA = rgb2grayMean(colorImg); 

%Otsu-------------------------------------
otsuSS = otsu(grayscaleSS);
otsuMA = otsu(grayscaleMA);
%--------------------------------

%RenyI -------
renyiSS = renyi(grayscaleSS);
renyiMA = renyi(grayscaleMA);
%-----------------------------------

%Mínima entropia
minSS = minimumCrossEntropy(grayscaleSS);
minMA = minimumCrossEntropy(grayscaleMA);
%----------------------------------------------

%APLICANDO KMEDIAS -------------------------------------------------------
num_cluster = 2;
kmeansSSTri = seg_kmeans(grayscaleSS,num_cluster);
kmeansMATri = seg_kmeans(grayscaleMA,num_cluster);