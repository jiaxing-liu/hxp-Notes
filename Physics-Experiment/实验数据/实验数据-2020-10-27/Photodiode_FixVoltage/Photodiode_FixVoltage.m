%%
% For a Given Photodiode,
% Given a Fixed Voltage betwen photoresistor, Find the relation of light
% and Ampere.
%%

clear
clc
close all
dirpath='./figures';
if ~exist(dirpath,'dir') 
    mkdir(dirpath); 
end

for i = [2 4 6 8]
    AnalyzeData(i)
end

function AnalyzeData(photodiode_volt)
    sampling_resistor=1.002e6;
    load(['data/photodiode_' num2str(photodiode_volt) 'V.mat']);
    
    photodiode_ampere=sample_voltage./sampling_resistor;
    photodiode_omega=photodiode_volt./photodiode_ampere;
    disp(['resistance of ' num2str(photodiode_volt) ' V :']);
    disp(photodiode_omega);
    figure
    plot(light_intensity, photodiode_ampere,'-*');
    xlabel('Light Intensity (Lux)');
    ylabel('Current of Photodiode (A)');
    title(['Voltage of Photodiode: ' ...
        num2str(photodiode_volt) ' V']);

    saveas(gcf,...
        ['figures/photodiode_' num2str(photodiode_volt) 'V'], 'epsc');
end