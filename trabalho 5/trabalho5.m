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
% imwrite(uint8(fft_inv_conj), 'conjugado.png');
% 
% figure();
% imwrite(uint8(fft_inv_trans), 'transposta.png');

%Propriedade: Que eu nao sei falar
% Y = fft2(img1);
% 
% Y_conjugado = conj(Y);
% 
% fft_inv_conj = conj(fft2(Y_conjugado)/(512*(512)));
% 
% figure();
% imshow(uint8(fft_inv_conj));


% TROCA DE MAGNITUDES ENTRE IMAGENS MANTENDO SUAS FASES - item s)

% clear all;
% close all;
% clc;
% 
% Carregando as imagens
% imageA = imread('lena.png');
% imageB = imread('cameraman.jpg');
% 
% Apresentando as imagens originais
% figure, imshow(imageA)
% title('lena.png')
% figure, imshow(imageB)
% title('cameraman.jpg')
% 
% FFT 2D das imagens
% fftA = fft2(double(imageA));
% fftB = fft2(double(imageB));
% 
% Troca de magnitudes entre as imagens mantendo suas respectivas fases
% fftA_maginvertida = abs(fftB).*exp(i*angle(fftA));
% fftB_maginvertida = abs(fftA).*exp(i*angle(fftB));
% 
% Recuperação da imagem através da transformada rápida 2D inversa
% imageA_maginvertida = ifft2(fftA_maginvertida);
% imageB_maginvertida = ifft2(fftB_maginvertida);
% 
% figure, imshow(abs(imageA_maginvertida), []), colormap gray
% title('lena.png com magnitude do cameraman.jpg')
% figure, imshow(abs(imageB_maginvertida), []), colormap gray
% title('cameraman.jpg com magnitude da lena.png')
% 
% imwrite(mat2gray(abs(imageA_maginvertida)), 'lena_with_cameraman_magnitude.png');
% imwrite(mat2gray(abs(imageB_maginvertida)), 'cameraman_with_lena_magnitude.jpg');
% 
% DESLOCAMENTO NA FREQUÊNCIA USANDO FFT2 - item h)
% 
% H=fftshift(fft2(imageA));
% H2=fftshift(fft2(imageB));
% 
% x0=50;
% y0=50;
% 
% Define shift in frequency domain
% [u, v] = meshgrid(-256:255,-256:255);
% 
% Perform the shift
% H=H.*exp(-1i*2*pi.*(u*x0 + v*y0)/(512));
% H2=H2.*exp(-1i*2*pi.*(u*x0 + v*y0)/(512));
% 
% Find the inverse Fourier Transform
% IF_lena=ifft2(ifftshift(H));
% IF_cameraman=ifft2(ifftshift(H2));
% 
% Show the images
% figure;
% subplot(2,2,1);
% imshow(imageA);
% subplot(2,2,2);
% imshow(mat2gray(real(IF_lena)));
% subplot(2,2,3);
% imshow(imageB);
% subplot(2,2,4);
% imshow(mat2gray(real(IF_cameraman)));
% 
% Create the results
% imwrite(mat2gray(real(IF_lena)), 'lena_shifted_by_50_pixels.png');
% imwrite(mat2gray(real(IF_cameraman)), 'cameraman_shifted_by_50_pixels.jpg');






