vid=VideoReader('video.mp4');

detecetor=vision.ForegroundDetector('NumGaussians', 4,'NumTrainingFrames', 4);
for i = 1:150
    frame=readFrame(vid);
    object=step(detecetor,frame);
end

figure , imshow(frame);
    title("Origi");
figure , imshow(object);
    title("Contrastlı");

structure=strel('square',3);
noisless=imopen(object,structure);
figure; imshow(noisless);title("Noislesss");

Bounding_Box=vision.BlobAnalysis('BoundingBoxOutputPort',true,'AreaOutputPort',false,'CentroidOutputPort',false,'MinimumBlobArea',150); 

box=step(Bounding_Box,noisless);
detect=insertShape(frame,'Rectangle',box,'Color','black');
figure,imshow(detect);title("Detected");

videoPlayer = vision.VideoPlayer('Name','Car Detection');
videoPlayer.Position(3:4) =  [650,400];

while hasFrame(vid)
    frame=readFrame(vid);
    object=step(detecetor,frame);
    noisless=imopen(object,structure);
    box=step(Bounding_Box,noisless);
    detect=insertShape(frame,'Rectangle',box,'Color','black');
    step(videoPlayer,detect);
end
