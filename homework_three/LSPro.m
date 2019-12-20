function []=LSPro()
clear;
RGB = imread('snow.jpg');
I = double (rgb2gray(RGB));
esobel=edge(I,'sobel');%sobert���Ӽ��ͼ���Ե
imshow(I);
imshow(esobel);
[imgH,imgW]=size(esobel);
p=1;
for i=1:imgH
    for j=1:imgW
            if esobel(i,j) ~= 0 
                x(p)=i;
                y(p)=j;
                p=p+1;
            end
    end
end
hold on;
for i=30:30:900
    x1=x(:,i-29:i);
    y1=y(:,i-29:i);
    % ��С���˷���ϵ������
    a = x1*x1';
    b = sum(x1);
    c = x1*y1';
    d = sum(y1);
    % ���б��k
    k = (length(x1).*c-b*d)./(length(x1).*a-b*b);
    % ���ؾ�t
    t = (a.*d-c.*b)/(a*length(x1)-b.*b);
    y1=x1*k+t;
    plot(x1,y1,'r');
end

