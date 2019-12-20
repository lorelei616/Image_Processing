function []=leastSquareMethod()
clear;
size = 200;  % ���ݵ㼯�Ĵ�С
x=rand(1,size);  % ����1*size��ʽ�ĸ�˹�ֲ�����
y=x;% ԭ����Ϊy=x
g=imnoise(y,'gaussian',0.01,0.002);%��y�������
noisenum=20; %��Ⱥ�������
noise1=rand(1,noisenum)*(max(x)-min(x))+min(x); % �˹����outlier
noise2=rand(1,noisenum)*(max(x)-min(x))+min(x);

x=[x noise1];
y=[g noise2];%�����Ⱥ��
scatter(x,y);hold on;

    x2 = sum(x*x');% ��(xi^2)
    x1 = sum(x);% ��(xi)
    xy = sum(x*y');% ��(xi*yi)
    y1 = sum(y); % ��(yi)

a=(length(x)*xy-x1*y1)/(length(x)*x2-x1*x1);      %���ֱ��б��b=(y1-a*x1)/n
b=(y1-a*x1)/length(x);                      %���ֱ�߽ؾ�

y2=x*a+b;
plot(x,y2,'r');
title(['���ֱ��Ϊ:  y =  ',num2str(a),'x + ',num2str(b)]);