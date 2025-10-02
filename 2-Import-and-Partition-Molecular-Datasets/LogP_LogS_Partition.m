function [X, Y, labels] = LogP_LogS_Partition(folderPath, fileName)
    % Construct the full file path
    fullPath = fullfile(folderPath, fileName);
    
    % Read data from CSV file, including the header
    data = readtable(fullPath);
    
    % Extract the LogS and LogP columns
    LogS = data.logS;
    LogP = data.logP;
    
    % Normalize the data (e.g., min-max normalization)
    LogS = (LogS - min(LogS)) / (max(LogS) - min(LogS));
    LogP = (LogP - min(LogP)) / (max(LogP) - min(LogP));
    
    % Initialize labels
    labels = strings(size(LogS));
    
    % Partition based on the given conditions for four partitions
    for i = 1:length(LogS)
        if LogS(i) > 0.5 && LogP(i) > 0.5
            labels(i) = "HighLogP-HighLogS";
        elseif LogS(i) > 0.5 && LogP(i) <= 0.5
            labels(i) = "LowLogP-HighLogS";
        elseif LogS(i) <= 0.5 && LogP(i) > 0.5
            labels(i) = "HighLogP-LowLogS";
        else
            labels(i) = "LowLogP-LowLogS";
        end
    end
    
    % Convert labels to categorical
    Y = categorical(labels);
    
    % Combine LogS and LogP into the data matrix X
    X = [LogS, LogP];
    
    % Visualize the data
    figure;
    hold on;
    % Plot each partition with different colors
    scatter(LogS(labels == "HighLogP-HighLogS"), LogP(labels == "HighLogP-HighLogS"), 'r', 'filled');
    scatter(LogS(labels == "LowLogP-HighLogS"), LogP(labels == "LowLogP-HighLogS"), 'g', 'filled');
    scatter(LogS(labels == "HighLogP-LowLogS"), LogP(labels == "HighLogP-LowLogS"), 'b', 'filled');
    scatter(LogS(labels == "LowLogP-LowLogS"), LogP(labels == "LowLogP-LowLogS"), 'k', 'filled');
    
    % Draw dashed lines at x = 0.5 and y = 0.5
    xline(0.5, '--k', 'LineWidth', 1.5); % Vertical line
    yline(0.5, '--k', 'LineWidth', 1.5); % Horizontal line
    
    hold off;
    
    % Add plot labels and title
    xlabel('Normalized LogS');
    ylabel('Normalized LogP');
    title('LogS vs LogP Partitioning');
    legend('HighLogP-HighLogS', 'LowLogP-HighLogS', 'HighLogP-LowLogS', 'LowLogP-LowLogS', 'Location', 'best');
end