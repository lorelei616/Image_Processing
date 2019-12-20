function []=RANSAC()
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
scatter(x,y);hold on;
data = [x' y']';
number = psize+noisenum;
sigma=1;
pretotal=0;     % 符合拟合模型的数据的个数

for i=1:100
% 随机选择两个点
    idx = randperm(number,2);
    %p = randperm(n,k) 返回行向量，
    %其中包含在 1 到 n（包括二者）之间随机选择的 k 个唯一整数。
    sample = data(:,idx);
    %data（：，y）就是指y列对应的所有行的值组成的一个向量
    %此处sample得到的是两个（x,y)坐标点
% 拟合直线方程 y=kx+b
    x = sample(1, :);%x取第一个坐标点
    y = sample(2, :);%y取第二个坐标点
% 直线斜率
    k=(y(1)-y(2))/(x(1)-x(2));      
    b = y(1) - k*x(1);
    line = [k -1 b];
% 求每个数据到拟合直线的距离
    mask=abs(line*[data; ones(1,size(data,2))]);
% 计算数据距离直线小于一定阈值的数据的个数
    total=sum(mask<sigma);             
% 找到符合拟合直线数据最多的拟合直线
    if total>pretotal            
        pretotal=total;
        bestline=line;
    end  
end
 
% 最佳拟合的数据
mask=abs(bestline*[data; ones(1,size(data,2))])<sigma;    
k=1;
for i=1:length(mask)
    if mask(i)
        inliers(1,k) = data(1,i);
        k=k+1;
    end
end

% 绘制最佳匹配曲线
k = -bestline(1)/bestline(2);
b = -bestline(3)/bestline(2);
x = min(inliers(1,:)):0.1:max(inliers(1,:));
y = k*x + b;
plot(x,y,'r');
title(['拟合直线为:  y =  ',num2str(k),'x + ',num2str(b)]);