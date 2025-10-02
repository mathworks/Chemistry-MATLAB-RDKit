function [binnedData, numMoleculesInBins] = binAndExportMolecules(similarityMatrix, bins, data)
    % 
    % This function groups molecules into bins and exports them to CSV files.
    %
    %   Inputs:
    %       similarityMatrix - NxN matrix of pairwise similarities
    %       bins             - Vector of bin edges
    %       data             - Table containing molecular data
    %   Outputs:
    %       binnedData        - Cell array of molecule indices for each bin
    %       numMoleculesInBins- Vector with number of molecules in each bin

    numMolecules = size(similarityMatrix, 1);
    numBins = length(bins) - 1;
    binnedData = cell(numBins, 1);
    numMoleculesInBins = zeros(numBins, 1);

    moleculeAssigned = false(numMolecules, 1);

    for i = 1:numMolecules
        for j = i+1:numMolecules
            similarity = similarityMatrix(i, j);
            binIndex = find(similarity >= bins(1:end-1) & similarity < bins(2:end), 1);
            if ~isempty(binIndex)
                if ~moleculeAssigned(i)
                    binnedData{binIndex} = [binnedData{binIndex}; i];
                    moleculeAssigned(i) = true;
                end
                if ~moleculeAssigned(j)
                    binnedData{binIndex} = [binnedData{binIndex}; j];
                    moleculeAssigned(j) = true;
                end
            end
        end
    end

    % Save binned data into separate CSV files and count molecules
    for i = 1:numBins
        if ~isempty(binnedData{i})
            uniqueIndices = unique(binnedData{i});
            clusteredData = data(uniqueIndices, :);
            clusterFileName = sprintf('bin_%d.csv', i);
            writetable(clusteredData, clusterFileName);

            numMoleculesInBins(i) = height(clusteredData);
        end
    end
end