
%Questao 1
mudaTamanho('lena_grayscale.png');

mudaTamanho('cameraman.jpg');

mudaTamanho('crowd.jpg');

%Questao 2  8, 7,6,5,4,3,2,
%Lena
I = imread('lena_grayscale.png');

for n = 1:7
    
    [X, map] = reduzBits(n, I);
    output = strcat('lena_grayscale', int2str(n), 'bits.png');
    imwrite(X, map, output);
end


%Cameraman
I = imread('cameraman.jpg');

for n = 1:7
    
    [X, map] = reduzBits(n, I);
    output = strcat('cameraman', int2str(n), 'bits.png');
    imwrite(X, map, output);
end



%Crowd
I = rgb2gray(imread('crowd.jpg'));

for n = 1:7
    
    [X, map] = reduzBits(n, I);
    output = strcat('crowd', int2str(n), 'bits.bmp');
    imwrite(X, map, output);
end



