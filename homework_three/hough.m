function []=hough()
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
scatter(x,y);
hold on;
data=[x;y];  
number=psize+noisenum; 
 % ����ռ� 
nma=5;
h=zeros(315,2*nma);  
ti=1;  
ma=80; % �����ֵ 
for theta=0:0.01:3.14  
    p=[cos(theta),sin(theta)];  
    d=p*data;  
    for i=1:number   
    h(ti,round(d(i)/10+nma))=h(ti,round(d(i)/10+nma))+1;   %���ڻ���ռ���d�Ƚϴ󣬶�dֵ���������� 
    end  
    ti=ti+1;  
end  
[tx,p]=find(h>ma);
lines=size(tx);% ����ֱ������  
r=(p-nma)*10;% ����ԭ�ؾ���R  
tx=0.01*tx;% ��theta��ԭ  
x=min(data(:)):0.05:max(data(:));  
% �����������  
    for i=1:40:lines  
        y = cot(tx(i))*x+r(i)/sin(tx(i));
        plot(x,y,'r');  
    end
end
