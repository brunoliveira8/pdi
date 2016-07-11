----------------------------------------------------------------------------------------------------
Training set for *The Second Overlapping Cervical Cytology Image Segmentation Challenge - ISBI 2015*
----------------------------------------------------------------------------------------------------
Release Date: 01 Dec 2014					Version: 1

*Contact email: isbi.cell.challenge@gmail.com


This dataset contains:
----------------------
1. "EDF" - the Extended Depth Field (EDF) cervical cytology image.

2. "frame0xx_stack" - 20 focus of each EDF image; 0xx is the ID of the image, e.g., frame004_stack.

3. "seg_fram0xx_png" - Annotation of each cell for image "frame0xx".

4. "AnnotationConfidence" - Confidence of the annotation for each cell, binary value: "H - High" and "L - Low".
							The file format is "cell_ID,confidence_value",
							e.g., "1,H" refers to cell 1 with High Confidence.

5. display_annotation.m - A Matlab code to show the annotation for each EDF image by cells.
