filename = "t";
filename = filename + ".jpg";
out = "out" + filename;
a = imread(filename);
s = size(a);
lab = rgb2lab(a);
rgb = lab2rgb(lab);
figure;
imshow(rgb);
title("original")

max = 0;
eab = zeros(s(1),s(2));
for j = 1:s(1)
    for k = 1:s(2)
        eab(j,k) = sqrt((lab(j,k,1)-100)*(lab(j,k,1)-100) + lab(j,k,2)*lab(j,k,2) + lab(j,k,3)*lab(j,k,3));
        if lab(j,k,1) > max
            max = lab(j,k,1);
        end
    end
end
max = max * 0.9
for j = 1:s(1)
    for k = 1:s(2)
        if lab(j,k,1) > max || eab(j,k) < 14
            lab(j,k,1) = 100;
            lab(j,k,2) = 0;
            lab(j,k,3) = 0;
        end
    end
end
rgb = lab2rgb(lab);
figure;
imshow(rgb);
title("white")

rgb = im2uint8(rgb);
alpha = 1
beta = 0
for j = 1:s(1)
    for k = 1:s(2)
        rgb(j,k,1) = rgb(j,k,1)*alpha + beta;
        rgb(j,k,2) = rgb(j,k,2)*alpha + beta;
        rgb(j,k,3) = rgb(j,k,3)*alpha + beta;

    end
end
figure, imshow(rgb), title("white + brighten");

rgb = im2double(rgb);
gg = zeros(s(1),s(2),3);
for it = 1:5
    it
    gg = bfilter2(rgb,gg,5,5,0.25);
    gg = bfilter2(gg,rgb,5,5,0.25);
    gg = medfil(gg);
end
figure;
imshow(gg);
title("white + brighten + AGF")

imwrite(gg,out);