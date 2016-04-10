function mudaTamanho (imageToConvert )
% carregar a imagem da lena_color.png
lena_grayscale = imread(imageToConvert);
name_size = size(imageToConvert);
name =  imageToConvert(1,1:name_size(2)-4);

% muda a resolução de 512x512 -> 256x256
lena_256grayscale = imresize(lena_grayscale, 0.5);
% mostra a imagem com resolução em 256x256
%figure;
output_file = strcat(name,'256.png');
imwrite(lena_256grayscale, output_file);


% muda a resolução de 512x512 -> 128x128
lena_128grayscale = imresize(lena_grayscale, 0.25);
% mostra a imagem com resolução em 256x256
% figure;
output_file = strcat(name,'128.png');
imwrite(lena_128grayscale, output_file);
% imshow(lena_128grayscale);


% muda a resolução de 512x512 -> 64x64
lena_64grayscale = imresize(lena_grayscale, 0.125);
% mostra a imagem com resolução em 64x64
% figure;
output_file = strcat(name,'64.png');
imwrite(lena_64grayscale, output_file);
% imshow(lena_64grayscale);


% muda a resolução de 512x512 -> 32x32
lena_32grayscale = imresize(lena_grayscale, 0.0625);
% mostra a imagem com resolução em 32x32
% figure;
output_file = strcat(name,'32.png');
imwrite(lena_32grayscale, output_file);
% imshow(lena_32grayscale);


% muda a resolução de 512x512 -> 16x16
lena_16grayscale = imresize(lena_grayscale, 0.03125);
% mostra a imagem com resolução em 16x16
% figure;
output_file = strcat(name,'16.png');
imwrite(lena_16grayscale, output_file);
% imshow(lena_16grayscale);