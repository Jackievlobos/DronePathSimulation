function [currentX,currentY,newCurrentX,newCurrentY, goalX, goalY, hyp,r,batteryChange, batteryChange2]=initializingArrays(numberOfIntervals)
currentX=zeros(numberOfIntervals,1);
currentY=zeros(numberOfIntervals,1);
newCurrentX=zeros(numberOfIntervals,1);
newCurrentY=zeros(numberOfIntervals,1);
goalX=zeros(numberOfIntervals,1);
goalY=zeros(numberOfIntervals,1);
hyp=zeros(numberOfIntervals,1);
r=zeros(numberOfIntervals,1);
batteryChange=0;
batteryChange2=0;
end 