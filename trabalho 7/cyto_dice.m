%Cyto Dice

path_gt = 'imagens/isbi2014_test/isbi2014_train/gt/Cyto/im';
path_seg = 'seg/im-';
cell_aux = [];
for i=1:45
    n_im = length(dir(strcat(path_gt,int2str(i))))-2;
    clear cell_aux;
    cell_aux = [];
    for l=1:n_im
        im = imread(strcat(path_gt,int2str(i),'/im_', sprintf('%03d', l), '.png' ));
        cell_aux{l,1} = logical(im);
    end
    csa{i,1} = cell_aux;
end


for i=1:45
    n_im = length(dir(strcat(path_seg,int2str(i))))-2;
    clear cell_aux;
    cell_aux = [];
    for l=1:n_im
        
        im = imread(strcat(path_seg,int2str(i),'/cell-', int2str(l), '.png' ));
        cell_aux{l,1} = logical(im);
        
    end
    cvt{i,1} = cell_aux;
end

display('Calculando medidas...');
[meanDice FNR meanTPR meanFPR stdDice stdTPR stdFPR STDFN] = evaluateCytoSegmentation(cvt,csa);

%%
clc
fprintf('\nDice=%0.3f(%0.3f) TP=%0.3f(%0.3f) FP=%0.3f(%0.3f) FN=%0.3f(%0.3f)\n',[meanDice stdDice meanTPR stdTPR meanFPR stdFPR FNR STDFN]);