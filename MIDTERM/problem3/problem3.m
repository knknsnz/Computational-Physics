clear all
close all
x=csvread('data.csv');
y=zeros(1,128);
trans=fft(x);
mag=abs(trans);

figure 

plot(mag)
xlabel('frequency index (f in units of 1/dt)')
ylabel('X(f)')


%%%%%problem 3b

for i = 1:127
    y(1,i)=(x(1,i)+x(1,i+1))/2;
end
y(1,128)=y(1,1);
trans2=fft(y);
mag2=abs(trans2);

figure

plot(mag2)
xlabel('frequency index (f in units of 1/dt)')
ylabel('y(f)')



%%%%%%%%%%%%%
%%%%%Similarities: the maximum values of data are similar after applying
%%%%%fft, period is same.
%%%%difference : in x data, we have the same value of peak in every
%%%%period,in y data, the peak is decreasing first, after reaching the
%%%%lowest peak, it starts to increasig again.
%%%%it's a low pass filter because A low-pass filter is a filter that
%%%%passes signals with a frequency lower than a selected cutoff frequency,
%%%%in y data, y is decreasing,so that is a low pass filter