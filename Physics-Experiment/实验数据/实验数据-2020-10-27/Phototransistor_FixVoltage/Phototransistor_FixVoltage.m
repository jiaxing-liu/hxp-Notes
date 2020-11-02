%%
% For a Given Phototransistor,
% Given a Fixed Voltage betwen phototransistor, Find the relation of light
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

function AnalyzeData(phototransistor_volt)
    sampling_resistor=203.32e3;
    load(['data/phototransistor_' num2str(phototransistor_volt) 'V.mat']);
    
    phototransistor_ampere=sample_voltage./sampling_resistor;
    phototransistor_omega=phototransistor_volt./phototransistor_ampere;
    disp(['resistance of ' num2str(phototransistor_volt) ' V:']);
    disp(phototransistor_omega);
    figure
    plot(light_intensity, phototransistor_ampere,'-*');
    xlabel('Light Intensity (Lux)');
    ylabel('Current of Phototransistor (A)');
    title(['Voltage of Phototransistor: ' ...
        num2str(phototransistor_volt) ' V']);

    saveas(gcf,...
        ['figures/phototransistor_' num2str(phototransistor_volt) 'V'], 'epsc');
end