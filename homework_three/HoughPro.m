function []=HoughPro()
clear;
RGB = imread('snow.jpg');
I = double (rgb2gray(RGB));
%sobert���Ӽ��ͼ���Ե
esobel=edge(I,'sobel');
%[H,T,R] = hough(esobel,'RhoResolution', 0.5);
subplot(2,2,1);
imshow(I);
title('ԭʼͼ��');
subplot(2,2,2);
imshow(esobel);
title('Sobel���Ӵ����');
%subplot(2,2,3);
%imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,'InitialMagnification','fit');
%title('hough�任');
xlabel('\theta ��'),ylabel('\rho ��');
axis on,axis normal,hold on;
colormap(hot);



