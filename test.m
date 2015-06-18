close all
clear
clc

I1 = imread('data/recon/001/left/LIMG_000.bmp');
I2 = im2bw(I1);

figure,
imshow(I1)

figure,
imshow(I2)