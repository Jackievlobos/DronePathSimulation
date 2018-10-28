%DroneSimulation

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
goalX=zeros(numberOfIntervals,1);
goalY=zeros(numberOfIntervals,1);
hyp=zeros(numberOfIntervals,1);
r=zeros(numberOfIntervals,1);

%Random Values
randAngs=(pi/10):(pi/100):(2*pi/10);
randDists=-0.3:0.01:0.05;


%line
hold on;
plot(beginX,beginY,'*b');
plot(endX,endY,'*b');
plot([beginX endX], [beginY endY]);

totalX=endX-beginX;
totalY=endY-beginY;

currentX(1)=beginX;
currentY(1)=beginY;

deltaX=totalX/numberOfIntervals;
deltaY=totalY/numberOfIntervals;

for n=1:numberOfIntervals
    if(n>1)
   goalX(n)=goalX(n-1)+deltaX;
   goalY(n)=goalY(n-1)+deltaY;
    else
   goalX(n)=goalX(n)+deltaX;
   goalY(n)=goalY(n)+deltaY;     
    end
   
end
plot(goalX,goalY,'*r');


%% Drone Movement
for n=1:numberOfIntervals
    hyp(n)=sqrt((goalX(n)-currentX(n)).^2+(goalY(n)-currentY(n)).^2);
    number=randi(length(randDists));
    randomR= randDists(number);
    r(n)=hyp(n)+randomR;
    
    number = randi(length(randAngs));
    randomAngle = randAngs(number);
    angle=atan(goalY(n)/goalX(n))+randomAngle;
    currentX(n+1)=r(n)*cos(angle);
    currentY(n+1)=r(n)*sin(angle);
end 
plot(currentX,currentY,'*g');
plot(currentX,currentY);



