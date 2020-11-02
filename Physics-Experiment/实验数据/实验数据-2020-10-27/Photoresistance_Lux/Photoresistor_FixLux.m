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
    Sampling_resistor=981.3;
    load(['data/Photoresistor_' num2str(Lux) 'Lux.mat']);

    Photoresistance_Voltage=PowerSource_Voltage-Sampling_resistor_Voltage;
    Photoresistance_Ampere=Sampling_resistor_Voltage./Sampling_resistor;
    Photoresistance_Omega=Photoresistance_Voltage./Photoresistance_Ampere;
    figure
    plot(Photoresistance_Ampere,Photoresistance_Ampere, '-*');
    xlabel('Current of Photoresistance (A)');
    ylabel('Voltage of Photoresistance (V)');
    title(['Resistance: ' ...
        num2str(mean(Photoresistance_Omega)) ' (\Omega)']);

    saveas(gcf,['figures/Photoresistance_' num2str(Lux) 'Lux'], 'epsc');
end