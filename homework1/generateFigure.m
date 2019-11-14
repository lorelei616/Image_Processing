function img = generateFigure(imgW,imgH)
    rsin  = zeros(imgH, imgW);
    gcos = zeros(imgH, imgW);
    bfunc = zeros(imgH, imgW);
    x = 1:imgW;
    x = (x-1)/(imgW-1)*2*pi;

    y1 = sin(x);
    y2 = cos(x);
    y3 = x.*x;
    
    y1 = (-y1+1)/2*(imgH-1)+1;
    y2 = (-y2+1)/2*(imgH-1)+1;
        
    minV = min(-y3);maxV=max(-y3);
    y3 = (-y3-minV)/(maxV-minV)*(imgH-1)+1;
    x = 1:imgW;
    y1 = round(y1); ind1 = y1+(x-1)*imgH;
    y2 = round(y2); ind2 = y2+(x-1)*imgH;
    y3 = round(y3); ind3 = y3+(x-1)*imgH;
    rsin (ind1) = 1;
    bfunc(ind2) = 1;
    gcos(ind3) = 1;
    img = cat(3, rsin, gcos, bfunc); 
end

