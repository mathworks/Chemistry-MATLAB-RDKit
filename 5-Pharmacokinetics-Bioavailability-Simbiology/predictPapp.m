function Papp = predictPapp(LogP, MW)
    % Based on Winiwarter et al., J. Med. Chem. 2003
    % Correlation of Human Jejunal Permeability (in Vivo) of Drugs with Experimentally and Theoretically Derived Parameters. A Multivariate Data Analysis Approach
    logPapp = 0.152 * LogP - 0.00359 * MW + 0.86;
    Papp = 10.^logPapp;
end