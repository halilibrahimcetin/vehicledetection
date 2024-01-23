%videoyu aç
video=VideoReader('video3.mp4');
%arkaplan dedektörü
dedektor=vision.ForegroundDetector('NumGaussians',3,'NumTrainingFrames',25);
for i = 1:dedektor.NumTrainingFrames
    frame=readFrame(video);
    obje=step(dedektor,frame);
end

%elde edilen sonuçları ham görüntü ile göster
figure,imshow(frame);title("Ham Görüntü");
figure,imshow(obje);title("GMM");

%gürültüyü morfolojik işlemlerle giderme
yapi=strel('square',6);
gurultu_filtresi=imopen(obje,yapi);
figure,imshow(gurultu_filtresi);title("Gürültüsüz Görüntü");

%blob analizi ile nesne tayini
cerceve=vision.BlobAnalysis('BoundingBoxOutputPort',true,'AreaOutputPort',false,'CentroidOutputPort',false,'MinimumBlobArea',800);

%belirlenen nesnelerin sınırlarına dikdörtgen koyma işlemi
isaretli_video=step(cerceve,gurultu_filtresi);
arac_tespit=insertShape(frame,'Rectangle',isaretli_video,'Color','yellow');

%elde edilen sonuçların gösterimi
figure,imshow(arac_tespit);title("Araç Tespiti");

videoPlayer=vision.VideoPlayer('Name','Sonuç');
videoPlayer.Position (3:4) = [650,400];

originalVideo=vision.VideoPlayer('Name','Ham Görüntü');
originalVideo.Position (3:4) = [650,400];

while hasFrame(video)
    frame=readFrame(video);
    obje=step(dedektor,frame);
    gurultu_filtresi=imopen(obje,yapi);
    isaretli_video=step(cerceve,gurultu_filtresi);
    arac_tespit=insertShape(frame,'Rectangle',isaretli_video,'Color','Yellow');
    step(videoPlayer,arac_tespit);
    step(originalVideo,frame);
end


