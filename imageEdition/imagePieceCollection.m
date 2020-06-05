classdef imagePieceCollection
%% This object could cut target image into predefined size and process
    properties
        imagePieces;
    end
    
    %% Methods
    methods
       %% Constructor
        %
        % image:            Source image
        % imagePieceHeight: Target height of image pieces
        % imagePieceWidth:  Target width of image pieces
        
        function obj = imagePieceCollection(image, imagePieceHeight, imagePieceWidth)
            obj.imagePieces = imageCut(image,imagePieceHeight,imagePieceWidth);
        end
        
       %% Binarize target image with target threshold
        %
        % obj:  Target source image
        
        function obj = ThresholdProcess(obj)
            numberOfRow = size(obj.imagePieces, 3);
            numberOfColumn = size(obj.imagePieces, 4);

            for rowIndex = 0:numberOfRow - 1
                for columnIndex = 0:numberOfColumn - 1
                    level = graythresh(obj.imagePieces(:,:,rowIndex + 1, columnIndex + 1));
                    temp = obj.imagePieces(:,:,rowIndex + 1, columnIndex + 1);
                    obj.imagePieces(:,:,rowIndex + 1, columnIndex + 1) = imbinarize(temp, level);
                end
            end
            obj.imagePieces = logical(obj.imagePieces);
        end
        
       %% Demonstrate all image pieces
        %
        % obj:  Target source image
        
        function showPieces(obj)
            showImagePieces(obj.imagePieces);
        end
        
       %% Merge current image pieces
        %
        % obj:  Target source image
        
        function outputImage = getImage(obj)
            outputImage = imageMerge(obj.imagePieces);
        end
        
    end
    
end

