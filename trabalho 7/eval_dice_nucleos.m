%Verifica o Dice
close all;
clear all;
clc;

dice = zeros([1 45]);
fnr = zeros([1 45]);

for i=1:45
    

    img_path = 'nucleos/isbi_train_im0';
    gt_path = 'imagens/isbi2014_test/isbi2014_train/gt/Nucleus/isbi_train_GT_im0';
    
    seg = imread(strcat(img_path,int2str(i),'.png'));
    gt = imread(strcat(gt_path, sprintf('%02d',i),'.png'));
    
    [ JI, Dice, TPR, FPR, FNR, TNR ] = SegEvaluateJIDiceTPRFPR( seg, gt );
    
    dice(i) = Dice;
    fnr(i) = FNR;
    

end

mean(dice)
mean(fnr)