%%
% For a Given Photoresistor,
% Given a Fixed Lux of illumination, Find the relation of Voltoge and 
% Ampere.
%%

clear
clc
close all
dirpath='./figures';
if ~exist(dirpath,'dir') 
    mkdir(dirpath); 
end

for i = [1003 2500 5000 7500]
    AnalyzeData(i)
end

function AnalyzeData(Lux)
    sampling_resistor=981.3;
    load(['data/Photoresistor_' num2str(Lux) 'Lux.mat']);

    photoresistance_voltage=PowerSource_Voltage-Sampling_resistor_Voltage;
    photoresistance_ampere=Sampling_resistor_Voltage./sampling_resistor;
    photoresistance_omega=photoresistance_voltage./photoresistance_ampere;
    figure
    plot(photoresistance_voltage,photoresistance_ampere, '-*');
    ylabel('Current of Photoresistance (A)');
    xlabel('Voltage of Photoresistance (V)');
    title(['Light Intensity: ' ...
        num2str(Lux) ' Lux']);

    saveas(gcf,['figures/photoresistance_' num2str(Lux) 'Lux'], 'epsc');
end