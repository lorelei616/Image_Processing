function Filter()

    p = imread('test.JPEG');  %����ͼƬ
    pGray = rgb2gray(p);  %��һ�����ɫͼ��ת���ɻҶ�ͼ��
    
    %ԭͼ
    subplot(5,6,1);  
   %subplot��m,n,p������subplot��m n p����subplot
   %�ǽ����ͼ����һ��ƽ���ϵĹ��ߡ����У�m��ʾ��ͼ�ų�m�У�
   %n��ʾͼ�ų�n�У�Ҳ��������figure����n��ͼ���ų�һ�еģ�һ��m�У����m=2���Ǳ�ʾ2��ͼ��
   %p��ʾͼ���ڵ�λ�ã�p=1��ʾ�����Ҵ��ϵ��µĵ�һ��λ�á�
    imshow(pGray);
    title('ԭʼͼ��');
    

    %��ӽ�������
    pSandP =imnoise(pGray,'salt & pepper',0.02); 
    subplot(5,6,2);
    imshow(pSandP);
    title('��������');
    
     %��Ӹ�˹����
    pGauss =imnoise(pGray,'gaussian',0.02); %�Ӿ�ֵΪ0������Ϊ0.02�ĸ�˹����
    subplot(5,6,3);
    imshow(pGauss);
    title('��˹����');
    
    %����ƽ���˲�J
    pMVFilter = MVFilter(pSandP,3);
    subplot(5,6,4);
    imshow(pMVFilter);
    title('������ֵ����������ͼ��');
    
     %����ƽ���˲�G
    pMVFilter = MVFilter(pGauss,3);
    subplot(5,6,5);
    imshow(pMVFilter);
    title('������ֵ�����˹����ͼ��');
    
    %���ξ�ֵ�˲�J
    pGMFilter = GMFilter(pSandP,3);
    subplot(5,6,6);
    imshow(pGMFilter);
    title('���ξ�ֵ����������ͼ��')
    
     %���ξ�ֵ�˲�G
    pGMFilter = GMFilter(pGauss,3);
    subplot(5,6,7);
    imshow(pGMFilter);
    title('���ξ�ֵ�����˹����ͼ��')
    
    %г����ֵ�˲���J
    pHMFilter = HMFilter(pSandP);
    subplot(5,6,8);
    imshow(pHMFilter);
    title('г����ֵ����������ͼ��');
    
     %г����ֵ�˲���G
    pHMFilter = HMFilter(pGauss);
    subplot(5,6,9);
    imshow(pHMFilter);
    title('г����ֵ�����˹����ͼ��');
    
    %��г����ֵ�˲���J
    pCHFilter = CHFilter(pSandP);
    subplot(5,6,10);
    imshow(pCHFilter);
    title('��г����ֵ����������ͼ��');
    
     %��г����ֵ�˲���G
    pCHFilter = CHFilter(pGauss);
    subplot(5,6,11);
    imshow(pCHFilter);
    title('��г����ֵ�����˹����ͼ��');
    
    %��ֵ�˲���J
    pMFilter = MFilter(pSandP);
    subplot(5,6,12);
    imshow(pMFilter);
    title('��ֵ�˲�������������');
    
    %��ֵ�˲���G
    pMFilter = MFilter(pGauss);
    subplot(5,6,13);
    imshow(pMFilter);
    title('��ֵ�˲��������˹����');
    
    %���ֵ�˲���J
    pMXFilter = MXFilter(pSandP);
    subplot(5,6,14);
    imshow(pMXFilter);
    title('���ֵ�˲�������������');
    
     %���ֵ�˲���G
    pMXFilter = MXFilter(pGauss);
    subplot(5,6,15);
    imshow(pMXFilter);
    title('���ֵ�˲��������˹����');
    
    %��Сֵ�˲���J
    pMNFilter = MNFilter(pSandP);
    subplot(5,6,16);
    imshow(pMNFilter);
    title('��Сֵ�˲�������������');
    
     %��Сֵ�˲���G
    pMNFilter = MNFilter(pGauss);
    subplot(5,6,17);
    imshow(pMNFilter);
    title('��Сֵ�˲��������˹����');
    
    %�е��˲���J
    pMPFilter = MPFilter(pSandP);
    subplot(5,6,18);
    imshow(pMPFilter);
    title('�е��˲�������������');
    
    %�е��˲���G
    pMPFilter = MPFilter(pGauss);
    subplot(5,6,19);
    imshow(pMPFilter);
    title('�е��˲��������˹����');
    
    %�����İ�������ֵ�˲���J
    pAFilter = AFilter(pSandP);
    subplot(5,6,20);
    imshow(pAFilter);
    title('������Alfa��ֵ�˲�������������');
    
    %�����İ�������ֵ�˲���G
    pAFilter = AFilter(pGauss);
    subplot(5,6,21);
    imshow(pAFilter);
    title('������Alfa��ֵ�˲��������˹����');
    
        %����Ӧ��ֵ�˲���J
    pAMFilter = AMFilter(pSandP);
    subplot(5,6,22);
    imshow(pAMFilter);
    title('����Ӧ��ֵ�˲�������������');
    
    %����Ӧ��ֵ�˲���G
    pAMFilter = AMFilter(pGauss);
    subplot(5,6,23);
    imshow(pAMFilter);
    title('����Ӧ��ֵ�˲��������˹����');
    
     %����Ӧ�˲���J
    pADFilter = ADFilter(pSandP);
    subplot(5,6,25);
    imshow(pADFilter);
    title('����Ӧ�˲�������������');
    
    %����Ӧ�˲���G
    pADFilter = ADFilter(pGauss);
    subplot(5,6,26);
    imshow(pADFilter);
    title('����Ӧ�˲��������˹����');

end

function y = MVFilter(pic,n)  % ������ֵ�˲��� 
    a(1:n,1:n)=1;   %a��n��nģ��,Ԫ��ȫ��1  
    [height, width]=size(pic);   %����ͼ����height x width��,��hight>n,width>n  
    x1=double(pic);  %double(y)��ʾ������yתΪ˫���ȸ������ͣ����y���ַ����������ַ���ASCII��ֵ����matlab�У�С���Ĵ洢��ʽ��Ϊdouble���͡�
    x2=x1;  
    for i=1:height-n+1  
        for j=1:width-n+1  
            c=x1(i:i+(n-1),j:j+(n-1)).*a; %ȡ��x1�д�(i,j)��ʼ��n��n��Ԫ����ģ�����  
            s=sum(sum(c));                 %��c�����и�Ԫ��֮��  
            x2(i+(n-1)/2,j+(n-1)/2)=s/(n*n); %����ģ�������ĸ�Ԫ�صľ�ֵ����ģ������λ�õ�Ԫ��  
        end  
    end  
    %δ����ֵ��Ԫ��ȡԭֵ  
    y=uint8(x2); 
end

function y = GMFilter(pic ,n)  % ���ξ�ֵ�˲���
    [height, width]=size(pic);%%����ͼ����height x width��
    x1=double(pic);
    F=x1+ones(height, width);  %��ֹ�����ص�Ϊ0�����³˻�Ϊ0 
    for i=1:height-n+1
        for j=1:width-n+1
            P=F(i:i+n-1,j:j+n-1);
            X=prod(P(:));  %���A��������prod(A)����A�����ĳ˻���
                              %���A�Ǿ���prod(A)��A����������������ÿһ��Ԫ�صĳ˻������һ��������B��
            x1(i+(n-1)/2,j+(n-1)/2)=X.^(1/numel(P));%��������A��Ԫ�ظ���������һ��ͼ����numel(A)����������������
        end 
    end
    y = uint8(x1);
end

function y = HMFilter(pic)   % 3*3��г����ֵ�˲���
[w,h]=size(pic);
x1=double(pic);
F=x1+ones(w,h);
fsize1=3;
fssize1=(fsize1-1)/2;
for x=1+fssize1:1:w-fssize1
    for y=1+fssize1:1:h-fssize1
            is=F(x-fssize1:1:x+fssize1,y-fssize1:1:y+fssize1);
            is=1./is;
            x1(x,y)=numel(is)/sum(is(:)); 
    end
end
    y = uint8(x1);
end
      
function y = CHFilter(pic)   % 3*3����г����ֵ�˲���
f=pic;
[w,h]=size(f);
x1=double(pic);
resultImage=x1+ones(w,h);
Q =1;
fsize1=3;
fssize1=(fsize1-1)/2;
for x=1+fssize1:1:w-fssize1
    for y=1+fssize1:1:h-fssize1
        is=f(x-fssize1:1:x+fssize1,y-fssize1:1:y+fssize1);
        resultImage(x,y) = sum(is(:).^(Q))/sum(is(:).^(Q-1));
    end
end
 y = uint8(resultImage);
end

function y = MFilter(pic)   % ��ֵ�˲���
f = pic;
[w,h] = size(f);
fsize1=3;
fssize1=(fsize1-1)/2;
resultImage = f;
for x=1+fssize1:1:w-fssize1
    for y=1+fssize1:1:h-fssize1
        is=f(x-fssize1:1:x+fssize1,y-fssize1:1:y+fssize1);
        temp = sort(is(:));
        resultImage(x,y)= temp((numel(temp)+1)/2);
    end
end
y = resultImage;
end

function y = MXFilter(pic)  % 3*3���ֵ�˲���
f=pic;
[w,h]=size(f);
fsize1=3;
fssize1=(fsize1-1)/2;
resultImage = pic;
for x=1+fssize1:1:w-fssize1
    for y=1+fssize1:1:h-fssize1
        is=f(x-fssize1:1:x+fssize1,y-fssize1:1:y+fssize1);
        temp = is(:);
        resultImage(x,y)= max(temp);
    end
end
y = resultImage;
end

function y = MNFilter(pic)  %  3*3��Сֵ�˲���
 f=pic;  
[w,h]=size(f);
fsize1=3;
fssize1=(fsize1-1)/2;
resultImage = pic;
for x=1+fssize1:1:w-fssize1
    for y=1+fssize1:1:h-fssize1
        is=f(x-fssize1:1:x+fssize1,y-fssize1:1:y+fssize1);
        temp = is(:);
        resultImage(x,y)= min(temp);
    end
end
y = resultImage;
end

function y = MPFilter(pic)  % 3*3�е��˲���
f=pic;
[w,h]=size(f);
fsize1=3;
fssize1=(fsize1-1)/2;
resultImage = pic;
for x=1+fssize1:1:w-fssize1
    for y=1+fssize1:1:h-fssize1
        is=f(x-fssize1:1:x+fssize1,y-fssize1:1:y+fssize1);
        temp = sort(is(:));
        resultImage(x,y)= (max(temp) + min(temp))/2;
    end
end
y = resultImage;
end

function y = AFilter(pic)   % 5*5�������İ�������ֵ�˲���
f = pic;
[w,h]=size(f);
n = 5; %ģ���С
d = 5; %ȥ����ֵ�Ҷ�ֵ�ĸ���
resultImage = f;
for i = 1:w-n+1
    for j = 1:h-n+1
        g3 = f(i:i+n-1,j:j+n-1);
        g3 = sort(g3(:)); %�������ڵ����ص��������
        min_num = ceil(d/2); %ȥ����С�Ҷ�ֵ�ĸ���
        max_num = floor(d/2); %ȥ�����Ҷ�ֵ�ĸ���
        %ȥ��d����ֵ�Ҷȼ�����������ֵ
        g3(1:min_num) = zeros(min_num,1);
        g3(n-max_num+1:n) = zeros(max_num,1);
        s3 = sum(g3);
        %���ĵ��ֵ����ͼ���������ֵ����
        resultImage(i+(n-1)/2,j+(n-1)/2) = s3/(n*n-d); 
    end
end
y = uint8(resultImage);
end

function y = ADFilter(pic) %����Ӧ�˲���
[w,h]=size(pic);
gImg=double(pic);
gNewImg=gImg;
fsize1=5;
fssize1=(fsize1-1)/2;

    for i=1+fssize1:w-fssize1
        for j=1+fssize1:h-fssize1
                gTemp = gImg(i-fssize1:i+fssize1,j-fssize1:j+fssize1);
                avg = mean(gTemp(:));
                v = var(gTemp(:));
                gNewImg(i,j)=gImg(i,j)-255*255*0.02*0.02/v*(gImg(i,j)-avg);
        end
    end
    y=uint8(gNewImg);
end


function y = AMFilter(f2) %����Ӧ��ֵ�˲���
f14 = f2;  
alreadyPro = false(size(f2)); %���Ƿ���ɽ��� falsea����������f2ͬ����С��ȫ0�߼�����
Smax=5;       %��󴰿ڳߴ�
for s = 3:2:Smax    %��ʼ���ڳߴ���Ϊ3
   %�õ��ض��ĻҶ�ֵ
   zmin = ordfilt2(f2, 1, ones(s, s), 'symmetric');  
   zmax = ordfilt2(f2, s * s, ones(s, s), 'symmetric');  
   zmed = medfilt2(f2, [s s], 'symmetric');  
   %����A
   processA = (zmed > zmin) & (zmax > zmed) & ~alreadyPro;   
   %����B
   processB = (f2 > zmin) & (zmax > f2);  
   outZxy  = processA & processB;  
   outZmed = processA & ~processB;  
   f14(outZxy) = f2(outZxy);  
   f14(outZmed) = zmed(outZmed);   
   alreadyPro = alreadyPro | processA;  
   if all(alreadyPro(:))  %���alreadyPro������ֵ����Ϊ1������forѭ��
      break;  
   end  
end  
f14(~alreadyPro) = zmed(~alreadyPro);  
y = uint8(f14);
end
