clc;
clear all;
close all;
delete(imaqfind)



vid=videoinput('winvideo',1);
triggerconfig(vid,'manual');
set(vid,'FramesPerTrigger',1 );
set(vid,'TriggerRepeat', Inf);


color_spec=vid.ReturnedColorSpace;

if  ~strcmp(color_spec,'rgb')
    set(vid,'ReturnedColorSpace','rgb');
end

start(vid)

faceDetector = vision.CascadeObjectDetector; 
faceDetectorM = vision.CascadeObjectDetector('Mouth'); 

   trigger(vid);
    im=getdata(vid,1); 
    imshow(im)
    
        % Detect faces
    bbox = step(faceDetector, im); 
    
  if ~isempty(bbox);
     bbox = bbox(1,:);
        % Plot box
    rectangle('Position',bbox,'edgecolor','r');
    
    
    
          Ic = imcrop(im,bbox);
          
        bboxM = step(faceDetectorM, Ic); 
        

        if ~isempty(bboxM);
            bboxMtemp = bboxM;
            
            if ~isempty(bboxMtemp)
            
                bboxM = bboxMtemp(1,:);
                Emouth =  imcrop(Ic,bboxM);

                % Plot box
                rectangle('Position',bboxM,'edgecolor','y');
           
  
            end
        end
    end