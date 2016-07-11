function display_annotation(frameID)
% DISPLAY_ANNOTATION Display the EDF cell image and its annotations of
% cytoplasm by the image ID.
%
% Input:
%   frameID - ID of EDF image. For example, 'frame000' refers to
%   './EDF_png/frame000.png'.
%
% Usage:
%   To display the annotation of image frame014:
%       display_annotation('frame014');
%
%   * Pause when display each annotation. Press <Enter> to continue...

if isempty(frameID)
    frameID = 'frame000';
end
    im_path = strcat('./EDF/', frameID, '.png');
    annotation_folder = strcat('./seg_', frameID, '_png/');
    nugt_path =strcat('./NucleusGT/', frameID, '_NUGT.png');
    fidConfidence = fopen(strcat('./AnnotationConfidence/', frameID, '-Table 1.csv'));
    C = textscan(fidConfidence, '%s');
    C = C{1,1};
    im = imread(im_path);
    nugt = imread(nugt_path);
    
    d = dir(annotation_folder);
    idCell = 1;
    for i = 1:size(d,1)
        if d(i,1).isdir == 0
            confidence_i = C{idCell,1};
            confidence_i = confidence_i(end);
            if strcmp(confidence_i, 'H')
                confidence_i = 'High';
            else
                confidence_i = 'Low';
            end
            msgTitle = strcat('Cell - ', num2str(idCell), ';   Confidence - ', confidence_i);
            figure(1); clf; imshow(im); hold on;
            contour(nugt, [0,0], 'r', 'LineWidth', 2)
            cytogt = imread(strcat(annotation_folder, d(i,1).name));
            contour(cytogt, [0,0], 'b');
            title(msgTitle, 'FontSize', 15);
            pause();
            idCell = idCell + 1;
        end
    end
    fprintf('Done!\n');
end