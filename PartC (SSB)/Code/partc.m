% Part C
%% First question 
B=1;
t=linspace(-5,5,1000); % Time vector
m2=sin(pi*B.*t)./(pi*t); % message signal
figure(1)
plot(t,m2)
xlabel("Time (msec)")
ylabel("m(t)")
%% Secound question
fc=5;
Ac=2;
hil=sin(pi*B.*(t-pi/2))./(pi*(t-pi/2));
x1=m2.*cos(2*pi*fc.*t)*Ac;
x2=hil.*sin(2*pi*fc.*t)*Ac;
ylow=x1+x2;
yup=x1-x2;
%% Third question & fourth
figure(2)
plot(t,yup)
xlabel("time")
ylabel("s(t) up")
figure(3)
plot(t,ylow)
xlabel("time")
ylabel("s(t) low")
%% fifth question 
yfreup=fft(yup);
yfrelow=fft(ylow);
n=length(t);
f = (0:n-1)*(fc/n);
powerup = abs(yfreup).^2/n;
powerlow=abs(yfrelow).^2/n;
figure(4)
pspectrum(yup,t)
title("upper")
figure(5)
pspectrum(ylow,t)
title("lower")
%% sixth question
ORD=ones(1,100)/170;
signal=yup;
demsignal=signal.*cos(2*pi*(fc).*t)*2;
%modsig=lowpass(demsignal,5,1000);
modsig=filter(ORD,1,demsignal);
%rr=demod(signal,5,1,'am');
figure(6)
plot(t,modsig)
title("Modulated signal")
