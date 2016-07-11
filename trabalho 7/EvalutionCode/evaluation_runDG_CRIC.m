%
% Geraldo e Daniel - mar/2015
%
%
clear
clc
warning off

tic

%numero das pastas que ser?o avaliadas
%pasta_number = [ 7 10 16 17 4 11 13 14]; % Training 
%pasta_number = [7 10 16 17]; % Training Jan2015
pasta_number = [4 11 13 14]; % Training Dec2014
%pasta_number = [0 1 2 15 18 19 20 21 22]; % Testing ... testing_R1_01Dec2014
%pasta_number = [18 19 20 21 22]; % Testing ... testing_R2_Jan2015
%pasta_number = [0 1 2 15]; % Testing ... testing_R1_01Dec2014 

%Endere?o da pasta das imagens segmentadas
%path_segmentada_algoritmo = '~/Dropbox/MAC/Pesquisa/Doutorado/CRIC/CRIC_Paper/simula/Hybrid_DG_v02_toHady/results/';
path_segmentada_algoritmo = '~/Dropbox/MAC/Pesquisa/Doutorado/CRIC/CRIC_Paper/simula/Hybrid_DG_v02/analysis/resultsDAN/';

%Dentro da pasta segmenta??o algoritmo e verdade terrestre deve existir uma
%pasta para cada imagem e essas pastas devem estar numeradas de forma
%sequencial

%modifique o conte?do dessa vari?vial para o nome da imagem na pasta de imagens segmentadas
%todas as imagens devem possuir o mesmo nome juntamente com uma numera??o
%sequencial, come?ando de 1
nome_segmentada_algoritmo = 'cell';

%o mesmo vale para as imagens da verdade terrestre
nome_verdade_terrestre = 'cell';

cell_aux = [];
%cont =1;
%Colocando todas as imagens da verdade terrestre em uma cell
for cont=1:length(pasta_number)
    i = pasta_number(cont);

    if i<0, continue; end
    
    if ~(cont<=4)
       path_verdade_terrestre = '~/Dropbox/CRICpaper2015/image/original/ISBI2015/training_r2_jan2015/seg_frame';%cell001.png
       %path_verdade_terrestre = '~/Dropbox/MAC/Pesquisa/Doutorado/CRIC/CRIC_Paper/simula/GT_Testing/GT_Testing_Jan2015/seg_frame';
    else
       path_verdade_terrestre = '~/Dropbox/CRICpaper2015/image/original/ISBI2015/training_r1_01dec2014/Training/seg_frame';%cell001.png
       %path_verdade_terrestre = '~/Dropbox/MAC/Pesquisa/Doutorado/CRIC/CRIC_Paper/simula/GT_Testing/GT_Testing_R1_01Dec2014/seg_frame';
    end

    path_verdade_terrestre_aux = [path_verdade_terrestre  sprintf('%03d',i) '_png/'];
    
    fprintf('Loading frame%03d\n',i);
    
    clear cell_aux
    
    for j=1:1000
        
        try
            im = imread([path_verdade_terrestre_aux nome_verdade_terrestre sprintf('%03d',j) '.png']);
%             disp([path_verdade_terrestre_aux nome_verdade_terrestre sprintf('%03d',j) '.png']);
            cell_aux{j,1} = logical(im);
        
        catch
            if( exist('cell_aux') )
                cvt{cont,1} = cell_aux;
                %cont = cont + 1
            end
            break;
        end
    end
end

disp('===================================');

%Colocando todas as imagens segmentadas em uma cell
for cont=1:length(pasta_number)
    i = pasta_number(cont);
    
        
    %path_segmentada_algoritmo_aux = [path_segmentada_algoritmo sprintf('%03d',i) '/cyto/' ];% pog int2str(i) '/cyto/']
    %path_segmentada_algoritmo_aux = [path_segmentada_algoritmo] %sprintf('%03d',i) '/cyto/' ];% pog int2str(i) '/cyto/']
    path_segmentada_algoritmo_aux = fullfile(path_segmentada_algoritmo, sprintf('frame%03d/',i) );% pog int2str(i) '/cyto/']
    clear cell_aux;
    
    %D=dir(fullfile(path_segmentada_algoritmo_aux,sprintf('frame%03d_cell_*.png',i)));
    D=dir(fullfile(path_segmentada_algoritmo_aux,'cell*.png'));
    
    %D=dir(fullfile(path_segmentada_algoritmo_aux,sprintf('cell*.png')));
    
    for j=1:length(D)
        im = imread(fullfile(path_segmentada_algoritmo_aux,D(j).name));
%         disp(fullfile(path_segmentada_algoritmo_aux,D(j).name));
%         imt=logical(zeros(size(im)+10));
%         imt(6:end-5,6:end-5)=im;
%         im=imt;
        
        figure(1)
        imshow(im)
        title(j)
        drawnow
        
        
        cell_aux{j,1} = logical(im);
    end
    csa{cont,1} = cell_aux;
end

%%

display('Calculando medidas...');
[meanDice FNR meanTPR meanFPR stdDice stdTPR stdFPR STDFN] = evaluateCytoSegmentation(cvt,csa);

%%
clc
fprintf('\nDice=%0.3f(%0.3f) TP=%0.3f(%0.3f) FP=%0.3f(%0.3f) FN=%0.3f(%0.3f)\n',[meanDice stdDice meanTPR stdTPR meanFPR stdFPR FNR    STDFN]);
toc
% Save ascii file with results of evaluation
 

% save([filename '_dice.dat'],'meanDice','FNR','meanTPR','meanFPR','stdDice','stdTPR','stdFPR','STDFN','-ascii');