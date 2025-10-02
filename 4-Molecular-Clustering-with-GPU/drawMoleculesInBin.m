function drawMoleculesInBin(binNumber, currentFolderPath, pythonExecutable, numToDraw)
    % 
    % This function draws a random selection of molecules from a specified bin CSV file.
    %
    %   Inputs:
    %       binNumber           - The bin number to visualize (e.g., 6)
    %       currentFolderPath   - Path to folder containing bin CSV files
    %       pythonExecutable    - Path or command for Python executable for RDKitDraw
    %       numToDraw           - Number of molecules to randomly select and draw

    binFileName = sprintf('bin_%d.csv', binNumber);
    binFilePath = fullfile(currentFolderPath, binFileName);

    if isfile(binFilePath)
        binData = readtable(binFilePath);
        if all(ismember({'SMILES','logP','logS'}, binData.Properties.VariableNames))
            smilesList = binData.SMILES;
            logPValues = binData.logP;
            logSValues = binData.logS;

            numMolecules = height(binData);

            if numMolecules == 0
                warning('No molecules found in %s.', binFileName);
                return;
            end

            % Adjust numToDraw if there are fewer molecules than requested
            if numToDraw > numMolecules
                numToDraw = numMolecules;
            end

            % Randomly select indices
            rng('shuffle'); % For true randomness each run
            randomIndices = randperm(numMolecules, numToDraw);

            figure;
            for plotIdx = 1:numToDraw
                rowIndex = randomIndices(plotIdx);
                subplot(ceil(sqrt(numToDraw)), ceil(sqrt(numToDraw)), plotIdx);
                smiles = smilesList{rowIndex};
                logP = logPValues(rowIndex);
                logS = logSValues(rowIndex);
                RDKitDraw(pythonExecutable, smiles, plotIdx, logP, logS);
            end
            sgtitle(sprintf('Random %d Molecules in Bin %d with LogP and LogS', numToDraw, binNumber));
        else
            error('The required columns (SMILES, logP, logS) are not present in %s.', binFileName);
        end
    else
        error('%s does not exist.', binFileName);
    end
end