%DroneSimulation
%% 
function [batteryChange,batteryChange2] =StraightLineSimulation(beginX, beginY, endX, endY, numberOfIntervals)
close all;
clc;
%[batteryChange, batteryChange2]= DroneSimulation(0, 0, 16, 16, 4)


%% Calculating Points

% Initialize Arrays
[batteryChange, batteryChange2]=initializingArrays(numberOfIntervals);

%Random Values
%randAngs=(pi/10):(pi/100):(2*pi/10);
%randDists=-0.3:0.01:0.05;

%Error Distributions
meanR=0.1252897418;
SDR=sqrt(0.009834816365);
meanA=-0.006321928483;
SDA=0.0003524338841;

%line

[currentX, currentY, newCurrentX, newCurrentY, goalX, goalY]=plotOriginalLine(beginX, beginY, endX, endY, numberOfIntervals);


%% Drone Movement

[batteryChange] = droneMovementWithoutCorrection(goalX, goalY, currentX, currentY, meanA, meanR, SDR, SDA,numberOfIntervals, batteryChange);

%% Drone Correction for Angle

[batteryChange2] = droneMovementWithCorrection(goalX, goalY, newCurrentX, newCurrentY, meanA, meanR, SDR, SDA,numberOfIntervals, batteryChange2);


end 