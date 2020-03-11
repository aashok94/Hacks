function csvFileName=arff2csv(fileName)
% It reads the arff fileName and converts it to a CSV file -> fileName+'.csv'
% The csv filename is returned
%         by Eftim Zdravevski, 2014
if nargin < 1,
	error('No input arguments!');
end
if nargin > 1,
	error('Too many input arguments!');
end
%% read whole string
wholeData = textread(fileName,'%s','delimiter','\n','whitespace','','bufsize',100000);
atRelation = '@relation';
atAttribute = '@attribute';
atData = '@data';
noOfLines = size(wholeData,1);
k=0;
%************************************************************************
%% Finding data name
dataStartsAt=find(strcmp(wholeData,atData));
dataStartsAt=dataStartsAt+1;
rawData=wholeData(dataStartsAt:noOfLines);
fileNameOnly = strrep(fileName, '.arff', '');
csvFileName=[fileNameOnly '.csv'];
% cell2csv(csvFileName,rawData);

%% Convert cell array to CSV file
separator = ',';
decimal = '.';
f = fopen(csvFileName, 'w');

for z=1:size(rawData, 1)
    for s=1:size(rawData, 2)
        
        var = eval(['rawData{z,s}']);
        % If zero, then empty cell
        if size(var, 1) == 0
            var = '';
        end
        % If numeric -> String
        if isnumeric(var)
            var = num2str(var);
            % Conversion of decimal separator (4 Europe & South America)
            % http://commons.wikimedia.org/wiki/File:DecimalSeparator.svg
            if decimal ~= '.'
                var = strrep(var, '.', decimal);
            end
        end
        % If logical -> 'true' or 'false'
        if islogical(var)
            if var == 1
                var = 'TRUE';
            else
                var = 'FALSE';
            end
        end
        
        % OUTPUT value
        fprintf(f, '%s', var);
        
        % OUTPUT separator
        if s ~= size(rawData, 2)
            fprintf(f, separator);
        end
    end
    if z ~= size(rawData, 1) % prevent a empty line at EOF
        % OUTPUT newline
        fprintf(f, '\n');
    end
end
% Closing file
fclose(f);


end
