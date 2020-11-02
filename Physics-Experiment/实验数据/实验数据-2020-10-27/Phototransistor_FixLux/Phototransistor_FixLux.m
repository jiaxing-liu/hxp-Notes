%%
% For a Given Phototransistor,
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

for i = [517 1002 1505 2000]
    AnalyzeData(i)
end

function AnalyzeData(Lux)
    sampling_resistor=203.32e3;
    load(['data/phototransistor_' num2str(Lux) 'Lux.mat']);

    phototransistor_voltage=powersource_voltage-sampling_voltage;
    phototransistor_ampere=sampling_voltage./sampling_resistor;
    phototransistor_omega=phototransistor_voltage./phototransistor_ampere;
    disp(['resistance of ' num2str(Lux) ' Lux:']);
    disp(phototransistor_omega);
    figure
    plot(phototransistor_voltage, phototransistor_ampere,'-*');
    ylabel('Current of Phototransistor (A)');
    xlabel('Voltage of Phototransistor (V)');
    title(['Light Intensity: ' ...
        num2str(Lux) ' (Lux)']);

    saveas(gcf,['figures/phototransistor_' num2str(Lux) 'Lux'], 'epsc');
end