%Select random folder names from a folder1
%Define number of folders to be selected by x in the Z = N(Y(1:x))

D = 'Path to folder1 ';
S = dir(fullfile(D,'*'));
X = [S.isdir] & ~ismember({S.name},{'.','..'});
N = {S(X).name};
Y = randperm(numel(N));
Z = N(Y(1:27))
Z = Z'