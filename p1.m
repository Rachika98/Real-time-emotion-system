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


   trigger(vid);
    im=getdata(vid,1); 
    imshow(im)