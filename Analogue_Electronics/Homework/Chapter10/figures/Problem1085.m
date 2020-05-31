clc
clear
x = linspace(-6,6,1000);
y = x;
z = x;
for i = 1:length(x)
    if x(i) < -3
        y(i) = -9;
    else
        y(i) = 9;
    end
end
for i = 1:length(x)
    if x(i) < 3
        z(i) = -9;
    else
        z(i) = 9;
    end
end
plot(x,y)
hold on
plot(x,z)
xticks([-3 0 3])
xticklabels({'-3','0','3'})
yticks([-9 0 9])
yticklabels({'-9','0','9'})
set(gca,'XLim',[-6 6],'YLim',[-10 10])
grid on