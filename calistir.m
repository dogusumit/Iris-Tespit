
%veriseti_hazirla;
load 'veriseti.mat';

inputs=girisler'; 
targets= cikislar'; 
net = feedforwardnet(2); %agim olusturuldu, gizli katman 2 tane 10ar noron
net = configure(net,inputs, targets); %giris-cikis katmanlari da ayarlandi
net.layers{1:2}.transferFcn = 'logsig'; %transfer fonksiyonu sigmoid
net.trainParam.max_fail = 1000; %max hatali iterasyon sayisi
net.trainParam.epochs = 100;
net.trainparam.mu=1e-50;
net.trainParam.mu_max=1e300;
[net, tr]=train(net,inputs,targets); %ag egitildi

test_sonuc=sim(net,test_girisler');
dogru=0;
test_veri_adedi=size(test_sonuc,2);
for i=1:test_veri_adedi
    if round(test_sonuc(i)) == test_cikislar(i)
        dogru=dogru+1;
    end
end
yuzde= dogru/test_veri_adedi*100;
fprintf('Agin test basarimi = %%%f',yuzde);
bar(yuzde);
title('Agin Basarimi %')
ylim([0 100]);
legend('ilk');