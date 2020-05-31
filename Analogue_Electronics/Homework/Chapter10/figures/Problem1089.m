clc
clear
x = linspace(0,2,1000);
y = x;
z = x;
for i = 1:length(x)
    if mod(x(i),1) < 1/2
        z(i) = 8;
        disp('aoeuaou');
    else
        z(i) = -8;
    end
end
subplot(2,1,1)
plot(x,z)
xticks([0 1/2 1 3/2 2])
yticks([-8 0 8])
set(gca,'XLim',[0 2],'YLim',[-10 10])
grid on
ylabel('v_{o1}');
xlabel('T');
for i = 1:length(x)
    if mod(x(i),1) < 0.5
        k(i)=mod(x(i),1)*2.72/0.25-2.72;
    else
        k(i)=-mod(x(i),1)*2.72/0.25+2.72*3;
    end
end
subplot(2,1,2)
plot(x,k)
xticks([0 1/2 1 3/2 2])
yticks([-2.72 0 2.72])
set(gca,'XLim',[0 2],'YLim',[-3 3])
grid on
ylabel('v_{o2}');
xlabel('T');