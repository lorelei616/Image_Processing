function []=HoughPro()
clear;
RGB = imread('snow.jpg');
I = double (rgb2gray(RGB));
%sobert算子检测图像边缘
esobel=edge(I,'sobel');
%[H,T,R] = hough(esobel,'RhoResolution', 0.5);
subplot(2,2,1);
imshow(I);
title('原始图像');
subplot(2,2,2);
imshow(esobel);
title('Sobel算子处理后');
%subplot(2,2,3);
%imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,'InitialMagnification','fit');
%title('hough变换');
xlabel('\theta 轴'),ylabel('\rho 轴');
axis on,axis normal,hold on;
colormap(hot);



