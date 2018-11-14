function [currentX, currentY, newCurrentX, newCurrentY, goalX, goalY]=plotOriginalLine(beginX, beginY, endX, endY, numberOfIntervals)
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
end
