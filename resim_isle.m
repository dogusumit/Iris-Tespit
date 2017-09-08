function donus=resim_isle(yol,goster)
img=imread(yol);

while size(img,1)>1000
    img=imresize(img,0.5);
end
if goster==true
    figure,subplot(3,2,1);
    imshow(img);
    title('Orjinal');
end
if size(img,3)==3
    gray=rgb2gray(img);
else
    gray=img;
end
if goster==true
    subplot(3,2,2);
    imshow(gray);
    title('Giri Skala');
end

binary=imbinarize(gray);
if goster==true
    subplot(3,2,3);
    imshow(binary);
    title('Siyah-Beyaz');
end

se = strel('disk',3);
opened=imopen(binary,se);
if goster==true
    subplot(3,2,4);
    imshow(opened);
    title('Morfoloji-Acma');
end

[centers, radii] = imfindcircles(opened,[40 60],'ObjectPolarity','dark', ...
    'Sensitivity',0.9);
%radii=radii+20;
marked=insertShape(img,'circle',[centers radii],'LineWidth',15,'Color','red');

if goster==true
    subplot(3,2,5);
    imshow(marked);
    title('Isaretlenmis');
end

x1=round(centers(1)-radii);
x2=round(centers(1)+radii);
y1=round(centers(2)-radii);
y2=round(centers(2)+radii);
donus=gray(y1:y2,x1:x2);
donus=imresize(donus,[50 50]);
if goster==true
    subplot(3,2,6);
    imshow(donus);
    title('Iris');
end
donus=reshape(donus,1,2500);
end

