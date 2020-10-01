x = linspace(0,4*pi,1000);
y = 5*sin(x);
subplot(3,1,1)
plot(x,y)
xticks([0 pi 2*pi 3*pi 4*pi])
xticklabels({'0','\pi','2\pi','3\pi','4\pi'})
yticks([-5 -2 0 2 5])
set(gca,'XLim',[0 4*pi],'YLim',[-6 6])
grid on
for i = 1:length(x)
    if y(i) > 2
        z(i) = -12;
    else
        z(i) = 12;
    end
end
subplot(3,1,2)
plot(x,z)
xticks([0 pi 2*pi 3*pi 4*pi])
xticklabels({'0','\pi','2\pi','3\pi','4\pi'})
yticks([-12 0 12])
set(gca,'XLim',[0 4*pi],'YLim',[-14 14])
grid on
for i = 1:length(x)
    if z(i) > 1.2
        k(i) = 0;
    else
        k(i) = 6;
    end
end
subplot(3,1,3)
plot(x,k)
xticks([0 pi 2*pi 3*pi 4*pi])
xticklabels({'0','\pi','2\pi','3\pi','4\pi'})
yticks([-6 0 6])
set(gca,'XLim',[0 4*pi],'YLim',[-1 7])
grid on