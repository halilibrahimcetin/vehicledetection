Vehicle Detection & Tracking: An Image Processing Case Study
Bu proje, Kocaeli Üniversitesi Elektronik ve Haberleşme Mühendisliği bölümü bünyesinde, "İmge İşleme" dersi kapsamında geliştirilmiştir. Projenin temel amacı, literatürdeki bir IEEE makalesinde sunulan yöntemleri kullanarak, bir MOBESE (CCTV) görüntüsü üzerinden araç tespit ve takip sistemini yeniden oluşturmak ve performansını analiz etmektir.

AMAÇ

Bu çalışma, hazır kütüphaneler (YOLO vb.) kullanmak yerine, görüntü işlemenin temel taşlarını (pixel-based processing) anlamaya odaklanır:
Mevcut bir akademik makaledeki metodolojiyi (IEEE standartlarında) birebir uygulamak.
MATLAB ortamında düşük seviyeli görüntü işleme algoritmaları geliştirmek.
Hareketli nesnelerin arka plandan ayrıştırılma sürecindeki matematiksel modelleri (GMM) deneyimlemek.



Makalede önerilen ve projede uygulanan 4 aşamalı akış şöyledir:
Gauss Karışım Modelleri (GMM): Arka planı (yol, ağaçlar vb.) hareketli nesnelerden (araçlar) ayırmak için kullanılan temel katman.
Gürültü Giderme (Noise Removal): Görüntüdeki parazitlerin (salt & pepper vb.) temizlenerek sağlıklı bir analiz alanı oluşturulması.
Blob Analizi: Tespit edilen hareketli "leke"lerin (blob) konum, alan ve merkez koordinatlarının analitik olarak hesaplanması.
İşaretleme (Bounding Box): Analiz edilen her bir nesnenin etrafına kullanıcı arayüzü için dikdörtgen çerçeveler atanması.


SONUÇLAR
Proje sürecinde yapılan testler sonucunda şu çıkarımlar yapılmıştır:
Optimizasyon İhtiyacı: Algoritmadaki filtre değerleri sabit değildir; videonun kontrast ve ışık koşullarına (gündüz/gece) göre manuel optimizasyon gerektirmektedir.
Performans: Sistem, stabil bir arka plana sahip MOBESE görüntülerinde yüksek doğrulukla çalışmaktadır.
Dezavantajlar: Dinamik arka plan değişimleri (rüzgarda sallanan ağaçlar vb.) sistemin hata payını artırabilmektedir.


English Summary
This repository contains a course project for Image Processing at Kocaeli University. The project reproduces a vehicle detection algorithm based on an IEEE paper's methodology. Key features include Gaussian Mixture Models (GMM) for background subtraction and Blob Analysis for tracking. The study emphasizes the importance of filter optimization based on environmental lighting conditions.
