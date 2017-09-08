girisler=double.empty(0,0);
cikislar=double.empty(0,0);%erkek=0,kadin=1
for i=1:2
    try
    girisler(end+1,:)=resim_isle(sprintf('egitim/erkek/%d.jpg',i),false);
    cikislar(end+1,1)=0;
    end
end
for i=1:2
    try
    girisler(end+1,:)=resim_isle(sprintf('egitim/kadin/%d.jpg',i),false);
    cikislar(end+1,1)=1;
    end
end

test_girisler=double.empty(0,0);
test_cikislar=double.empty(0,0);%erkek=0,kadin=1
for i=1:2
    try
    test_girisler(end+1,:)=resim_isle(sprintf('test/erkek/%d.jpg',i),false);
    test_cikislar(end+1,1)=0;
    end
end
for i=1:2
    try
    test_girisler(end+1,:)=resim_isle(sprintf('test/kadin/%d.jpg',i),false);
    test_cikislar(end+1,1)=1;
    end
end
save 'veriseti.mat';