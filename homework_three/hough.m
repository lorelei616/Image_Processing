function []=hough()
clear;
psize = 200;  % 数据点集的大小
x=rand(1,psize);  % 产生1*size形式的高斯分布数据
y=x;% 原曲线为y=x
g=imnoise(y,'gaussian',0.01,0.002);%给y添加噪声
noisenum=20; %离群点点数量
noise1=rand(1,noisenum)*(max(x)-min(x))+min(x); % 人工添加outlier
noise2=rand(1,noisenum)*(max(x)-min(x))+min(x);

x=[x noise1];
y=[g noise2];%添加离群点
scatter(x,y);
hold on;
data=[x;y];  
number=psize+noisenum; 
 % 霍夫空间 
nma=5;
h=zeros(315,2*nma);  
ti=1;  
ma=80; % 拟合阈值 
for theta=0:0.01:3.14  
    p=[cos(theta),sin(theta)];  
    d=p*data;  
    for i=1:number   
    h(ti,round(d(i)/10+nma))=h(ti,round(d(i)/10+nma))+1;   %由于霍夫空间中d比较大，对d值进行了缩放 
    end  
    ti=ti+1;  
end  
[tx,p]=find(h>ma);
lines=size(tx);% 符合直线条数  
r=(p-nma)*10;% 将还原回距离R  
tx=0.01*tx;% 将theta还原  
x=min(data(:)):0.05:max(data(:));  
% 画出拟合曲线  
    for i=1:40:lines  
        y = cot(tx(i))*x+r(i)/sin(tx(i));
        plot(x,y,'r');  
    end
end
