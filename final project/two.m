filename = "s";
filename = "out"+filename+".jpg";
a = imread(filename);
s = size(a);
b = rgb2gray(a);
ed = edge(b,'Canny');
%figure,imshow(ed), title("canny");
randm = zeros(s(1), s(2));
b = 0;
w = 1;
for j = 2:s(1)-1
    for k = 2:s(2)-1
        if ed(j,k) == b
            if(ed(j-1,k-1) == w || ed(j-1,k) == w || ed(j-1,k+1) == w || ed(j,k-1) == w ||ed(j,k+1) == w ||ed(j+1,k-1) == w ||ed(j+1,k) == w ||ed(j+1,k+1) == w)
                if rand > 0.3
                    randm(j,k) = w;
                end
             end
        end
    end
end
ed = ed + randm;
ed = not(ed);
figure, imshow(ed), title("canny + ��t�������N")
%%%%%%
filed = medfil(a);
out = a;
for j = 1:s(1)
    for k = 1:s(2)
        if ed(j,k) == 1
            out(j,k,:) = filed(j,k,:);
        end
    end
end
figure, imshow(out), title("edge + ��t�������N + medfil")



dith = 3
ndith = dith * -1;
for j = 1:s(1)
    for k = 1:s(2)
        if ed(j,k) == w
            r = randi([ndith dith]);
            nj = j;
            nk = k;
            if j+r > 0 && j+r <= s(1)
                nj = j+r;
            end
            r = randi([ndith dith]);
            if k+r > 0 && k+r <= s(2)
                nk = k+r;
            end
            out(j,k,:) = filed(nj,nk,:);
        end
    end
end
out = medfil(out);
figure,imshow(out), title("dither")
%out(:,:,1) = filter2(fspecial('disk',3),out(:,:,1));
%out(:,:,2) = filter2(fspecial('disk',3),out(:,:,2));
%out(:,:,3) = filter2(fspecial('disk',3),out(:,:,3));
%figure,imshow(out), title("edge + medfil + disk")
%%%%
lab = rgb2lab(out);
for j = 1:s(1)
    for k = 1:s(2)
        if ed(j,k) == b
            lab(j,k,1) = lab(j,k,1) * 0.95;
        end
    end
end
out = lab2rgb(lab);
figure,imshow(out), title("darken")
g = rgb2gray(out);

imwrite(out, "out" + filename);
%%%%%%

white = g;
for j = 1:s(1)
    for k = 1:s(2)
        white(j,k) = 0;
        if lab(j,k,1) > 85
            white(j,k) = 1;
        end
    end
end

mm = mean(g,'all')
figure,imshow(g)
% 32*32
noise32 = g;
scale = 32;
for j = 0:s(1)/scale-1
    for k = 0:s(2)/scale-1
        rrr = roundn(rand, -1) - 0.5;
        rrr = rrr * 0.6;
        for u = 1:scale
            for i = 1:scale
                if white(j*scale+u, k*scale+i) == 0
                    tmp = rrr + noise32(j*scale+u, k*scale+i);
                    noise32(j*scale+u, k*scale+i) = tmp;
                end
            end
        end
    end
end
%figure,imshow(noise32)
noise32 = im2double(noise32);
smooth32 = filter2(fspecial('disk',7),noise32);
figure,imshow(smooth32), title("32");
% 16*16
noise16 = g;
scale = 16;
for j = 0:s(1)/scale-1
    for k = 0:s(2)/scale-1
        rrr = roundn(rand, -1) - 0.5;
        rrr = rrr * 0.6;
        for u = 1:scale
            for i = 1:scale
                if white(j*scale+u, k*scale+i) == 0
                    tmp = rrr + noise16(j*scale+u, k*scale+i);
                    noise16(j*scale+u, k*scale+i) = tmp;
                end
            end
        end
    end
end
%figure,imshow(noise16)
noise16 = im2double(noise16);
smooth16 = filter2(fspecial('disk',7),noise16);
figure,imshow(smooth16), title("16");

all = (smooth16 + smooth32) / 2;
all = 0.6 + all*0.4;
figure,imshow(all)
lab = rgb2lab(out);
for j = 1:s(1)
    for k = 1:s(2)
        lab(j,k,1) = lab(j,k,1) * all(j,k);
    end
end
rgb = lab2rgb(lab);
figure,imshow(rgb)
filename = "out"+filename
imwrite(rgb,filename);