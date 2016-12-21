function [f,g]=objfun(x,meas,mode)

% x contains the Magic Formula parameters to be tuned to reduce the fit error
B =x(1);
C =x(2);
D =x(3);
E =x(4);
y =B*(meas.alpha+x(5));

% evaluate the Magic Formula for the measured alphas
Fy = D*sin(C*atan((1-E).*y + E.*atan(y)))+x(6);

if mode==1
% return the error between the measured Fy and Magic Formula model using a quadratic criterion
  f=sum((meas.Fy-Fy).^2);
  g=[];
elseif mode==2
% return the error between the measured Fy and Magic Formula model using a quadratic criterion
  f=sum((meas.Fy-Fy).^2);
  g=[];
  plot(meas.alpha*180/pi,meas.Fy,'o',meas.alpha*180/pi,Fy)
  text(-18.5,4500,['Magic Formula coefficient:'])
  text(-18,4000,['B = ' num2str(B) ])
  text(-18,3500,['C = ' num2str(C) ])
  text(-18,3000,['D = ' num2str(D) ])
  text(-18,2500,['E = ' num2str(E) ])
  text(-18,2000,['alpha offset = ' num2str(x(5)*180/pi) ])
  text(-18,1500,['Fy offset = ' num2str(x(6)) ])
  title('computer minimizes the difference between measurement and model...')
  axis([-20 20 -5000 5000])
  drawnow
  pause(0.1)
else
% return the Magic Formula model results 
  f=Fy;
  g=[];
end
return
