function []=RANPro()
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
data = [x' y']';
number = size(data,2)
sigma=1;
pretotal=0;     % �������ģ�͵����ݵĸ���

for i=1:100
% ���ѡ��������
    idx = randperm(number,2);
    sample = data(:,idx)
% ���ֱ�߷��� y=kx+b
    x = sample(1, :)
    y = sample(2, :);
% ֱ��б��
    k=(y(1)-y(2))/(x(1)-x(2));      
    b = y(1) - k*x(1);
    line = [k -1 b];
% ��ÿ�����ݵ����ֱ�ߵľ���
    mask=abs(line*[data; ones(1,size(data,2))]);
% �������ݾ���ֱ��С��һ����ֵ�����ݵĸ���
    total=sum(mask<sigma);             
% �ҵ��������ֱ�������������ֱ��
    if total>25            
        pretotal=total;
        bestline=line;
        % �����ϵ�����
        mask=abs(bestline*[data; ones(1,size(data,2))])<sigma;    
        k=1;
        for i=1:length(mask)
            if mask(i)
                inliers(1,k) = data(1,i);
                k=k+1;
            end
        end

        % �������ƥ������
        k = -bestline(1)/bestline(2);
        b = -bestline(3)/bestline(2);
        x = min(inliers(1,:)):0.1:max(inliers(1,:));
        y = k*x + b;
        plot(x,y,'r');
    end  
end