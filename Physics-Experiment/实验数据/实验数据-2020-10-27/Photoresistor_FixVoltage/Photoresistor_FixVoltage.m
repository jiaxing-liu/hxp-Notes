%%
% For a Given Photoresistor,
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

for i = [2 4 6 8 10]
    AnalyzeData(i)
end

function AnalyzeData(photoresistor_volt)
    Sampling_resistor=981.3;
    load(['data/photoresistor_' num2str(photoresistor_volt) 'V.mat']);
    
    Photoresistance_Ampere=sample_resistor_voltage./Sampling_resistor;
    Photoresistance_Omega=photoresistor_volt./Photoresistance_Ampere
    figure
    plot(light_intensity, Photoresistance_Ampere,'-*');
    xlabel('Light Intensity (Lux)');
    ylabel('Current of Photoresistance (A)');
    title(['Resistance: ' ...
        num2str(mean(Photoresistance_Omega)) ' (\Omega)']);

    saveas(gcf,...
        ['figures/photoresistance_' num2str(photoresistor_volt) 'V'], 'epsc');
end