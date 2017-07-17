function txt2hkl(varargin)


% This function converts texture files in .txt format to .hkl format for
% use in resmat software
% User must have his text files in hkl.txt format e.g. 111.txt
% This function should be used e.g. txt2hkl('111'). Output hkl files will
% be saved in the current folder as e.g. 111.txt.hkl

%%

for ii=1:1:nargin
    file_name = varargin{ii};


%% Initialize variables.
delimiter = '\t';
% if nargin<=2
    startRow = 19;
    endRow = inf;


%% Read columns of data as strings:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*s%s%[^\n\r]';

%% Open the text file.
filename = [file_name '.txt'];
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
textscan(fileID, '%[^\n\r]', startRow(1)-1, 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    textscan(fileID, '%[^\n\r]', startRow(block)-1, 'ReturnOnError', false);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'ReturnOnError', false);
    dataArray{1} = [dataArray{1};dataArrayBlock{1}];
end

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric strings to numbers.
% Replace non-numeric strings with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = dataArray{col};
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

% Converts strings in the input cell array to numbers. Replaced non-numeric
% strings with NaN.
rawData = dataArray{1};
for row=1:size(rawData, 1);
    % Create a regular expression to detect and remove non-numeric prefixes and
    % suffixes.
    regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
    try
        result = regexp(rawData{row}, regexstr, 'names');
        numbers = result.numbers;
        
        % Detected commas in non-thousand locations.
        invalidThousandsSeparator = false;
        if any(numbers==',');
            thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
            if isempty(regexp(thousandsRegExp, ',', 'once'));
                numbers = NaN;
                invalidThousandsSeparator = true;
            end
        end
        % Convert numeric strings to numbers.
        if ~invalidThousandsSeparator;
            numbers = textscan(strrep(numbers, ',', ''), '%f');
            numericData(row, 1) = numbers{1};
            raw{row, 1} = numbers{1};
        end
    catch me
    end
end


%% Exclude rows with non-numeric cells
J = ~all(cellfun(@(x) (isnumeric(x) || islogical(x)) && ~isnan(x),raw),2); % Find rows with non-numeric cells
raw(J,:) = [];

%% Allocate imported array to column variable names
AlphaR20000 = cell2mat(raw(:, 1));

%%
b = AlphaR20000';
% b = dataArray{:, 1}';
nst(1)=1;
nend(1)=73;
for i=2:1:18
    nst(i) = nst(i-1)+82;
    nend(i) = nst(i)+72;
end
%%

c = [b(nst(13):nend(13));b(nst(12):nend(12));b(nst(11):nend(11));b(nst(10):nend(10));...
    b(nst(9):nend(9));b(nst(8):nend(8));b(nst(7):nend(7));b(nst(6):nend(6));...
    b(nst(5):nend(5));b(nst(4):nend(4));b(nst(3):nend(3));b(nst(2):nend(2));b(nst(1):nend(1))];
% n=size(c,1);
l=size(c,2);
d=zeros(6,l);
m1=[c;d];
str1 = 'This pole figure file is created by HTexTools software\n';      %# A string
str2 = 'Cubic, (1 1 1), 5.00, 19 x 73, (1.00 1.00 1.00 90.00 90.00 90.00), C:\Documents and Settings\Smart\Desktop\ssq.HODF';
mat1 = m1;           %# A 2-by-2 matrix
fName =[file_name '.hkl'];         %# A file name
fid = fopen(fName,'w');            %# Open the file
if fid ~= -1
  fprintf(fid,'%s\r\n',str1);       %# Print the string
  fprintf(fid,'%s\r\n',str2);
  fclose(fid);                     %# Close the file
end
dlmwrite(fName,mat1,'-append',...  %# Print the matrix
         'delimiter','\t',...
         'newline','pc');
     
end