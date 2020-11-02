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
    sampling_resistor=981.3;
    load(['data/photoresistor_' num2str(photoresistor_volt) 'V.mat']);
    
    photoresistance_ampere=sample_resistor_voltage./sampling_resistor;
    photoresistance_omega=photoresistor_volt./photoresistance_ampere;
    disp(['resistance of ' num2str(photoresistor_volt) ' V:']);
    disp(photoresistance_omega);
    figure
    plot(light_intensity, photoresistance_ampere,'-*');
    xlabel('Light Intensity (Lux)');
    ylabel('Current of Photoresistance (A)');
    title(['Voltage of Photoresistor: ' ...
        num2str(photoresistor_volt) ' V']);

    saveas(gcf,...
        ['figures/photoresistance_' num2str(photoresistor_volt) 'V'], 'epsc');
end