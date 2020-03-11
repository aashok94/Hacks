files = dir('*.arff') ; 
N = length(files) ; 
for i = 1:N
    fname = files(i).name ; 
    disp(fname)
    arff2csv(fname)
end