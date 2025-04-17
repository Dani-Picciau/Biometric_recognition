function faceImage = face_detection(image)
    [bboxes, scores, landmarks] = mtcnn.detectFaces(image);
    fprintf("Found %d faces.\n", numel(scores));
    
    displayIm = insertObjectAnnotation(image, "rectangle", bboxes, scores, "LineWidth", 2);
    imshow(displayIm)
    hold on
    for iFace = 1:numel(scores)
        scatter(landmarks(iFace, :, 1), landmarks(iFace, :, 2), 'filled');

        % Return the cropped face image of the first detected face, if any
        if ~isempty(bboxes)
            faceImage = imcrop(image, bboxes(1, :));
        else
            faceImage = []; % Return an empty array if no faces are detected
        end
    end
end
  
%  To run the program, enter the following in the command window:
%  1. mtcnn = vision.CascadeObjectDetector(); //define a mtcnn object to 
%  initialize the mtcnn detector
%  2. test_image = imread('imagepath'); //load the image
%  3. Navigate to the folder where the file face_detection.m is located
%  4. face_detection(test_image); //to start the function
