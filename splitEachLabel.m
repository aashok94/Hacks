%Given a single folder with multiple audio files
%First label the first half of files as A's and B's
%Second, randomize the files by shuffling
%Third, split into 80-20 files and store in train and test

folder = '/home/a_ashok/AA/Thesis/Audio_database/RAVDESS+TESS_training_set/wav/' ;
ADS = audioDatastore(folder,'FileExtensions','.wav');

labels = [repmat({'A'},1,floor(numel(ADS.Files)/2)),repmat({'B'},1,ceil(numel(ADS.Files)/2))]
ADS.Labels = labels;
%[ADS1,ADS2] = splitEachLabel(ADS,2,'randomized');
shuffledADS = shuffle(ADS)
[ADS3,ADS4] = splitEachLabel(shuffledADS,0.8)

outputLocation1 = '/home/a_ashok/AA/Thesis/Audio_database/RAVDESS+TESS_training_set/wav/train/';
writeall(ADS3,outputLocation1);

outputLocation2 = '/home/a_ashok/AA/Thesis/Audio_database/RAVDESS+TESS_training_set/wav/test/';
writeall(ADS4,outputLocation2);