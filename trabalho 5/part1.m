clc
clear all
close all

img1 = imread('lena.png');
figure;
imshow(img1);

% img2 = imread('cameraman.jpg');
% figure;
% imshow(img2);

%Propriedade: Separabilidade
% Y1 = fft2(img1);
% mag = abs(Y);
% theta = angle(Y);
% mag = log(mag+1);
% mag = mat2gray(mag);
% figure;
% imshow(mag);
% 
% Y2 = fft(fft(img1).').';
% 
% fft1_inv = ifft2(Y1);
% fft2_inv = ifft2(Y2);
% 
% figure();
% imshow(uint8(fft1_inv));
% 
% figure();
% imshow(uint8(fft2_inv));


%Propriedade: Troca de fase e magnitude
% Y1 = fft2(img1);
% Y2 = fft2(img2);
% mag1 = abs(Y1);
% theta1 = angle(Y1);
% mag2 = abs(Y2);
% theta2 = angle(Y2);
% fft1_inv = ifft2(mag1.*exp(theta2*1i));
% fft2_inv = ifft2(mag2.*exp(theta1*1i));
% 
% figure();
% imshow(uint8(fft1_inv));
% 
% figure();
% imshow(uint8(fft2_inv));

%Propriedade: Conjugado e Transposto

% Y = fft2(img1);
% 
% Y_conjugado = conj(Y);
% 
% Y_transposto = transpose(Y);
% 
% fft_inv_conj = ifft2(Y_conjugado);
% fft_inv_trans = ifft2(Y_transposto);
% 
% figure();
% imshow(uint8(fft_inv_conj));
% 
% figure();
% imshow(uint8(fft_inv_trans));

%Propriedade: Que eu nao sei falar
Y = fft2(img1);

Y_conjugado = conj(Y);

fft_inv_conj = conj(fft2(Y_conjugado)/(512*(512)));

figure();
imshow(uint8(fft_inv_conj));






