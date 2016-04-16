%Trabalho 3

img = imread('lena_grayscale.png');



amount = 100;
img_noises = zeros(amount);

for i = 1:amount
  img_noises(i) = imnoise(img,'gaussian');
end


figure;
imshow(img)