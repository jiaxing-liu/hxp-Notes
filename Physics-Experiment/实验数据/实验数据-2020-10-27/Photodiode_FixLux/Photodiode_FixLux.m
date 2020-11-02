%%
% For a Given Photodiode,
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

for i = [506 1008 2000 3000]
    AnalyzeData(i)
end

function AnalyzeData(Lux)
    sampling_resistor=1.002e6;
    load(['data/photodiode_' num2str(Lux) 'Lux.mat']);

    photodiode_voltage=powersource_voltage-sampling_voltage;
    photodiode_ampere=sampling_voltage./sampling_resistor;
    photodiode_omega=photodiode_voltage./photodiode_ampere;
    figure
    plot(photodiode_voltage, photodiode_ampere,'-*');
    ylabel('Current of Photodiode (A)');
    xlabel('Voltage of Photodiode (V)');
    title(['Light Intensity: ' ...
        num2str(Lux) ' (Lux)']);

    saveas(gcf,['figures/photodiode_' num2str(Lux) 'Lux'], 'epsc');
end