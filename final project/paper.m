alpha = 0.3;
filename = "1";
texturefile = "paper2.jpg";
% filename = "output" + filename + ".jpg";
filename = "result_1.2.jpg";
texture = imread(texturefile);
texture = rgb2gray(texture);
a = imread(filename);
% figure, imshow(a)
a = rgb2lab(a);   
s = size(a);
texture = imresize(texture, 2);
texture = texture(1:s(1), 1:s(2));
% figure, imshow(texture)
temp_mean = mean2(texture);
temp_std = std2(texture);
texture2 = (double(texture) - temp_mean) / temp_std;
texture2 = texture2 / max(max(abs(texture2))) + 0.5;
texture2 = alpha * texture2 + (1 - alpha);
for j = 1:s(1)
    for k = 1:s(2)
        a(j,k,1) = a(j,k,1) * texture2(j,k);
    end
end
a = lab2rgb(a);

figure, imshow(a)
