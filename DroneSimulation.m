%DroneSimulation

close all;
clc;
%% User Inputs
beginX=input('What is your starting x? \n');
beginY=input('What is your starting y? \n');

endX=input('What is your final x? \n');
endY=input('What is your final y? \n');

pathChoice=input('What path would you like to follow? \n(Click 1 for line)\n');
numberOfIntervals= input('How many intervals would you like to break the path into?\n');




%% Calculating Points

% Initialize Arrays

currentX=zeros(numberOfIntervals,1);
currentY=zeros(numberOfIntervals,1);
newCurrentX=zeros(numberOfIntervals,1);
newCurrentY=zeros(numberOfIntervals,1);
goalX=zeros(numberOfIntervals,1);
goalY=zeros(numberOfIntervals,1);
hyp=zeros(numberOfIntervals,1);
r=zeros(numberOfIntervals,1);

%Random Values
randAngs=(pi/10):(pi/100):(2*pi/10);
randDists=-0.3:0.01:0.05;

%Error Distributions
meanR=0.1252897418;
SDR=sqrt(0.009834816365);
meanA=-0.006321928483;
SDA=0.0003524338841;

%line
hold on;
plot(beginX,beginY,'*b');
plot(endX,endY,'*b');
plot([beginX endX], [beginY endY]);

totalX=endX-beginX;
totalY=endY-beginY;

currentX(1)=beginX;
currentY(1)=beginY;
newCurrentX(1)=beginX;
newCurrentY(1)=beginY;

deltaX=totalX/numberOfIntervals;
deltaY=totalY/numberOfIntervals;

for n=1:numberOfIntervals
    if(n>1)
   goalX(n)=goalX(n-1)+deltaX;
   goalY(n)=goalY(n-1)+deltaY;
    else
  %goalX(n)=goalX(n)+deltaX;
  %goalY(n)=goalY(n)+deltaY; 
   goalX(n)=beginX +deltaX;
   goalY(n)=beginY +deltaY;
    end
    
   
end
plot(goalX,goalY,'*r');


%% Drone Movement



for n=1:numberOfIntervals
    
    hyp(n)=sqrt((goalX(n)-currentX(n)).^2+(goalY(n)-currentY(n)).^2);
    %number=randi(length(randDists));
    %randomR= randDists(number);
    randomR= normrnd(meanR,SDR);
    r(n)=hyp(n)+randomR;
    
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

%% Drone Correction for Angle


anglecorrection=-1.5*pi/10;
for n=1:numberOfIntervals
    hyp(n)=sqrt((goalX(n)-newCurrentX(n)).^2+(goalY(n)-newCurrentY(n)).^2);
    %number=randi(length(randDists));
    %randomR= randDists(number);
    randomR= normrnd(meanR,SDR);
    r(n)=hyp(n)+randomR;
    
   % number = randi(length(randAngs));
   % randomAngle = randAngs(number);
     randomAngle= normrnd(meanA,SDA);
    
checkX=(goalX(n)-currentX(n));
checkY=(goalY(n)-currentY(n));

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

