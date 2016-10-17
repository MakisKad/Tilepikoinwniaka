clear all;

T = 1;
over = 10;
Ts = T/over;
Fs = 1/Ts;
A = 4;
k=0;

%A.1 gia a=0;
a=0;
[grafima1,time1]=srrc_pulse(T,Ts,A,a,k);
plot(time1,grafima1,'red');
hold on;
grid on;

%A.1 gia a=0.5;
a=0.5;
[grafima2,time2]=srrc_pulse(T,Ts,A,a,k);
plot(time2,grafima2,'green');

%A.1 gia a=1;
a=1;
[grafima3,time3]=srrc_pulse(T,Ts,A,a,k);
plot(time3,grafima3,'blue');

%A.2 
Nf=2048;
Step=Fs/Nf;
Xfax=[-Fs/2:Step:Fs/2-Fs/Nf];

Xf1=fftshift(abs(fft(grafima1,Nf)));
figure(2);
plot(Xfax,Xf1,'black')
axis([ -2 2 -0.5 12 ])
hold on;
grid on;

Xf2=fftshift(abs(fft(grafima2,Nf)));
plot(Xfax,Xf2,'blue');

Xf3=fftshift(abs(fft(grafima3,Nf)));
plot(Xfax,Xf3,'red');

figure(3);
semilogy(Xfax,Xf1.^2,'red');
hold on;
grid on;

semilogy(Xfax,Xf2.^2,'black');

semilogy(Xfax,Xf3.^2,'blue');


%A.3
c1=(0.*Xfax)+(T/(10^3));
semilogy(Xfax,c1,'cyan')

c2=(0.*Xfax)+(T/(10^5));
semilogy(Xfax,c2,'green')

%B.1
%a
figure(4);
for k=[0:2*A]
	[grafimaB1,timeB1]=srrc_pulse(T,Ts,A,a,k);
	plot(timeB1,grafimaB1)
	hold on;
	grid on;
end
%b

for k=[0:2*A]
	[grafima_shft1,time_shft]=srrc_pulse(T,Ts,A,a,k);
	phiShifted=grafima1.*grafima_shft1;
	figure;
	plot(time_shft,phiShifted)
	hold on;
	grid on;
end
%c
q=sum(phiShifted)


%C.1
N=50;
b=(sign(randn(N,1))+1)/2;

%C.2 

%a 
Xk=bits_to_2PAM(b,N)

%b 
%ti malakies kanw




