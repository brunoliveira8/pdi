function MSE= MSE(img, img_new)
    [M, N] = size(img);
    error = img - (img_new);
    MSE = sum(sum(error .* error)) / (M * N);
end