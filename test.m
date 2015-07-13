close all
clear
clc

src = imread('data/recon/001/left/LIMG_000.bmp');
figure,
imshow(src)
% 在原图画矩形框住兴趣区域
h=get(0,'CurrentFigure');
rect = getrect(h);
rectxmin = floor(rect(1));  %最小的x轴坐标
rectymin = floor(rect(2));  %最小的y轴坐标
rectwidth = floor(rect(3)); %长度
rectheight = floor(rect(4));%宽度

[rows, cols] = size(src);

% 二值化图像
binaryMet = zeros(rows,cols);
Imax=max(max(src));
Imin=min(min(src));
threshold=(Imax-Imin)/5+Imin;
string = zeros(rows,cols);
k=1;
for i=1:rows
    for j=1:cols
        if src(i,j)>threshold ...
                && i>=rectymin ...
                && i<=rectymin+rectheight...
                && j>=rectxmin ...
                && j<=rectxmin+rectwidth
            binaryMet(i,j)=1;
        else
            binaryMet(i,j)=0;
        end
    end
    j = 1;
    stop = 1;
    while stop==1
        if binaryMet(i,j)==1
            string(i,j)=1;
            location(k,1)=i;
            location(k,2)=j;
            k=k+1;
            stop = 0;
        elseif j==cols
            stop = 0;
        end
        j=j+1;
    end
end

figure,
imshow(binaryMet)

figure,
imshow(string),hold on
plot(location(:,2),location(:,1),'w-','LineWidth',0.01)
