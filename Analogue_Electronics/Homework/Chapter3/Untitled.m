clc
clear
subplot(2,1,1);
x = [0:0.01:3*pi];
y1 = 6*sin(2*x);
plot(x,y1)
yticks([-6 0 6])
xticks([0:pi/2:3*pi])
xlim([0,3*pi])
ylim([-7 7]);
xticklabels({'0', '0.5T','T','1.5T','2T','2.5T','3T'})
grid on

subplot(2,1,2); 
x = [0:0.01:3*pi];
y1 = 6*sin(2*x);
for i = 1:size(x,2)
    if y1(i) > 3.7
        y1(i) = 3.7;
    end
    if y1(i) < -3.7
        y1(i) = -3.7;
    end
end
plot(x,y1)
yticks([-6 -3.7 0 3.7 6])
xticks([0:pi/2:3*pi])
xlim([0,3*pi])
ylim([-7 7]);
xticklabels({'0', '0.5T','T','1.5T','2T','2.5T','3T'})
grid on