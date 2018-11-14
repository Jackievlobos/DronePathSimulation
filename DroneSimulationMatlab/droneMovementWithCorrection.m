function [batteryChange2, newCurrentX, newCurrentY] = droneMovementWithCorrection(goalX, goalY, newCurrentX, newCurrentY, meanA, meanR, SDR, SDA,numberOfIntervals, batteryChange2)
anglecorrection=-1.5*pi/10;
for n=1:numberOfIntervals
    hyp(n)=sqrt((goalX(n)-newCurrentX(n)).^2+(goalY(n)-newCurrentY(n)).^2);
    %number=randi(length(randDists));
    %randomR= randDists(number);
    randomR= normrnd(meanR,SDR);
    r(n)=hyp(n)+randomR;
    currentR=r(n);
   batteryChange2=batteryusage(batteryChange2,currentR);
    
   % number = randi(length(randAngs));
   % randomAngle = randAngs(number);
     randomAngle= normrnd(meanA,SDA);
    
checkX=(goalX(n)-newCurrentX(n));
checkY=(goalY(n)-newCurrentY(n));

    if(checkX>0 && checkY>0)
        angle=atan((goalY(n)- newCurrentY(n))/(goalX(n)-newCurrentX(n)))+randomAngle + anglecorrection;
    elseif(checkX<0 && checkY>0)
        angle=pi-atan(abs((goalY(n)- newCurrentY(n))/(goalX(n)-newCurrentX(n))))+randomAngle + anglecorrection;
    elseif(checkX>0 && checkY<0)
        angle=atan((goalY(n)- newCurrentY(n))/(goalX(n)-newCurrentX(n)))+randomAngle + anglecorrection;
    elseif(checkX<0 && checkY<0)
        angle=pi+atan((goalY(n)- newCurrentY(n))/(goalX(n)-newCurrentX(n)))+randomAngle + anglecorrection;
    elseif(checkX==0 && checkY>0)
        angle=pi/2+randomAngle+anglecorrection;
    elseif(checkX==0 && checkY<0) 
        angle=-pi/2+randomAngle+anglecorrection;
    elseif(checkX>0 && checkY==0)
        angle=0+randomAngle+anglecorrection;
    elseif(checkX<0 && checkY==0) 
        angle=pi+randomAngle + anglecorrection;
     end

    
    newCurrentX(n+1)=newCurrentX(n)+r(n)*cos(angle);
    newCurrentY(n+1)=newCurrentY(n)+r(n)*sin(angle);
end 
plot(newCurrentX,newCurrentY,'c--o');
plot(newCurrentX,newCurrentY);

end