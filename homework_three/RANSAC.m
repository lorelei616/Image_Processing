function []=RANSAC()
clear;
psize = 200;  % ���ݵ㼯�Ĵ�С
x=rand(1,psize);  % ����1*size��ʽ�ĸ�˹�ֲ�����
y=x;% ԭ����Ϊy=x
g=imnoise(y,'gaussian',0.01,0.002);%��y�������
noisenum=20; %��Ⱥ�������
noise1=rand(1,noisenum)*(max(x)-min(x))+min(x); % �˹����outlier
noise2=rand(1,noisenum)*(max(x)-min(x))+min(x);

x=[x noise1];
y=[g noise2];%�����Ⱥ��
scatter(x,y);hold on;
data = [x' y']';
number = psize+noisenum;
sigma=1;
pretotal=0;     % �������ģ�͵����ݵĸ���

for i=1:100
% ���ѡ��������
    idx = randperm(number,2);
    %p = randperm(n,k) ������������
    %���а����� 1 �� n���������ߣ�֮�����ѡ��� k ��Ψһ������
    sample = data(:,idx);
    %data������y������ָy�ж�Ӧ�������е�ֵ��ɵ�һ������
    %�˴�sample�õ�����������x,y)�����
% ���ֱ�߷��� y=kx+b
    x = sample(1, :);%xȡ��һ�������
    y = sample(2, :);%yȡ�ڶ��������
% ֱ��б��
    k=(y(1)-y(2))/(x(1)-x(2));      
    b = y(1) - k*x(1);
    line = [k -1 b];
% ��ÿ�����ݵ����ֱ�ߵľ���
    mask=abs(line*[data; ones(1,size(data,2))]);
% �������ݾ���ֱ��С��һ����ֵ�����ݵĸ���
    total=sum(mask<sigma);             
% �ҵ��������ֱ�������������ֱ��
    if total>pretotal            
        pretotal=total;
        bestline=line;
    end  
end
 
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
title(['���ֱ��Ϊ:  y =  ',num2str(k),'x + ',num2str(b)]);