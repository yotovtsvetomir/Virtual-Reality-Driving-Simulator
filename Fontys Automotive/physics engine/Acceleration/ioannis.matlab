TorqueMap=[ -18   22 25 28;
            -19.5 23 26 29; 
            -21.5 11 22 32]
RPM=[1400 1900 2400]
Throttle=[0 .2 .3 .4]

InputRpm=2000
InputThrottle=.27

i=find(RPM>=InputRpm) % index of upper bound for RPM
interF=[min(i-1),min(i)] % 
i1=find(Throttle>=InputThrottle) % index of upper bound for Throttle
interF1=[min(i1-1),min(i1)]

% choose x,y

x1 = RPM(interF)
x2 = Throttle(interF1)
y = TorqueMap(interF,interF1) 

% New bar
yy1 = y(1,1) + ( y(2,1) - ( y(1,1) ) ) / ( x1(2) - x1(1) ) * ( InputRpm - x1(1))
yy2 = y(1,2) + ( y(2,2) - ( y(1,2) ) ) / ( x1(2) - x1(1) ) * ( InputRpm - x1(1))

%Point 
yNew = yy1 + ( yy2 - yy1 ) / ( x2(2) - x2(1) ) * ( InputThrottle -x2(1))