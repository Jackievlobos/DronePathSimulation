function batteryChange = batteryusage(batteryChange,currentR)
if (currentR>1)
    batteryChange=batteryChange+0.5;
else
    batteryChange=batteryChange+0.3;
end 

end