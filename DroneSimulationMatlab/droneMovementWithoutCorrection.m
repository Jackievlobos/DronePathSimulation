function [batteryChange, currentX, currentY] = droneMovementWithoutCorrection(goalX, goalY, currentX, currentY, meanA, meanR, SDR, SDA,numberOfIntervals, batteryChange)
for n=1:numberOfIntervals
    
    hyp(n)=sqrt((goalX(n)-currentX(n)).^2+(goalY(n)-currentY(n)).^2);
    %number=randi(length(randDists));
    %randomR= randDists(number);
    randomR= normrnd(meanR,SDR);
    r(n)=hyp(n)+randomR;
    currentR=r(n);
    batteryChange=batteryusage(batteryChange,currentR);
    
   % number = randi(length(randAngs));
   % randomAngle = randAngs(number);
    randomAngle= normrnd(meanA,SDA);
    
    checkX=(goalX(n)-currentX(n));
    checkY=(goalY(n)-currentY(n));

    if(checkX>0 && checkY>0)
        angle=atan((goalY(n)- currentY(n))/(goalX(n)-currentX(n)))+randomAngle;
    elseif(checkX<0 && checkY>0)
        angle=pi-atan(abs((goalY(n)- currentY(n))/(goalX(n)-currentX(n))))+randomAngle ;
    elseif(checkX>0 && checkY<0)
        angle=atan((goalY(n)- currentY(n))/(goalX(n)-currentX(n)))+randomAngle ;
    elseif(checkX<0 && checkY<0)
        angle=pi+atan((goalY(n)- currentY(n))/(goalX(n)-currentX(n)))+randomAngle;
    elseif(checkX==0 && checkY>0)
        angle=pi/2+randomAngle;
    elseif(checkX==0 && checkY<0) 
        angle=-pi/2+randomAngle;
    elseif(checkX>0 && checkY==0)
        angle=0+randomAngle;
    elseif(checkX<0 && checkY==0) 
        angle=pi+randomAngle;
     end
    
    
    currentX(n+1)=currentX(n)+r(n)*cos(angle);
    currentY(n+1)=currentY(n)+r(n)*sin(angle);
end 
plot(currentX,currentY,'og');
plot(currentX,currentY);
end