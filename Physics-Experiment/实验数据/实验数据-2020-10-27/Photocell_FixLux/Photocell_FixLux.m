%%
% For a Given Photocell,
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

for i = [503 1003 1495 2000 2500 3000]
    AnalyzeData(i)
end

function AnalyzeData(Lux)
    sampling_resistor=100;
    load(['data/photocell_' num2str(Lux) 'Lux.mat']);

    photocell_voltage=cell_voltage;
    photocell_ampere=(cell_voltage)./(sampling_resistor+load_resistor);
    figure
    plot_result=plot(photocell_voltage,photocell_ampere, '-*');
    ylabel('Current of Photoresistance (A)');
    xlabel('Voltage of Photoresistance (V)');
    title(['Light Intensity: ' ...
        num2str(Lux) ' Lux']);

    saveas(gcf,['figures/photocell_' num2str(Lux) 'Lux'], 'epsc');
end