clear;
close all;


load('HysteresisLoop.mat');

magnetic_field_strength=HysteresisLoop_20V(:,1);
magnetic_induction=HysteresisLoop_20V(:,2);
figure;
plot(magnetic_field_strength,magnetic_induction,"LineStyle","-");
title("Hysteresis Loop (20V Voltage)");
xlabel("Magnetic Field Strength (Ampere/Meter)");
ylabel("Magnetic Induction (Tesla)");
grid on;
hold off;
saveas(gcf,'HysteresisLoop_20V','epsc');

figure;
hold on;
magnetic_field_strength=HysteresisLoop_20V(:,1);
magnetic_induction=HysteresisLoop_20V(:,2);
permeability=magnetic_induction./magnetic_field_strength;
% plot(magnetic_field_strength,magnetic_induction);
plot(magnetic_field_strength,permeability,"+","LineStyle",":");
title("Permeability (20V Voltage)");
xlabel("Magnetic Field Strength (Ampere/Meter)");
ylabel("Permeability (Henries/Meter)");
grid on;
hold off;
saveas(gcf,'Permeability_20V','epsc');

magnetic_field_strength=HysteresisLoop_10V(:,1);
magnetic_induction=HysteresisLoop_10V(:,2);
figure;
plot(magnetic_field_strength,magnetic_induction,"LineStyle","-");
title("Hysteresis Loop (10V Voltage)");
xlabel("Magnetic Field Strength (Ampere/Meter)");
ylabel("Magnetic Induction (Tesla)");
grid on;
hold off;
saveas(gcf,'HysteresisLoop_10V','epsc')

figure;
hold on;
magnetic_field_strength=HysteresisLoop_10V(:,1);
magnetic_induction=HysteresisLoop_10V(:,2);
permeability=magnetic_induction./magnetic_field_strength;
% plot(magnetic_field_strength,magnetic_induction);
plot(magnetic_field_strength,permeability,"+","LineStyle",":");
title("Permeability (10V Voltage)");
xlabel("Magnetic Field Strength (Ampere/Meter)");
ylabel("Permeability (Henries/Meter)");
grid on;
hold off;
saveas(gcf,'Permeability_10V','epsc');
