function []=leastSquareMethod()
clear;
size = 200;  % 数据点集的大小
x=rand(1,size);  % 产生1*size形式的高斯分布数据
y=x;% 原曲线为y=x
g=imnoise(y,'gaussian',0.01,0.002);%给y添加噪声
noisenum=20; %离群点点数量
noise1=rand(1,noisenum)*(max(x)-min(x))+min(x); % 人工添加outlier
noise2=rand(1,noisenum)*(max(x)-min(x))+min(x);

x=[x noise1];
y=[g noise2];%添加离群点
scatter(x,y);hold on;

    x2 = sum(x*x');% 求Σ(xi^2)
    x1 = sum(x);% 求Σ(xi)
    xy = sum(x*y');% 求Σ(xi*yi)
    y1 = sum(y); % 求Σ(yi)

a=(length(x)*xy-x1*y1)/(length(x)*x2-x1*x1);      %解出直线斜率b=(y1-a*x1)/n
b=(y1-a*x1)/length(x);                      %解出直线截距

y2=x*a+b;
plot(x,y2,'r');
title(['拟合直线为:  y =  ',num2str(a),'x + ',num2str(b)]);