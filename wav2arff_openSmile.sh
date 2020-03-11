#!/bin/bash

FILES=(directory path/*wav)
for f in $FILES
do
	#echo "${f##*/}"
	echo $f 
	fname="$(basename "${f}")"
	echo $fname
	name=$(echo "$fname" | cut -f 1 -d '.') # for .arff filename
	#echo $name
	fn="${name:6:2}" # to access 6th position which is the emotion (RAVDESS data set)
	#echo $fn
	
	case $fn in
        01)
            emotion="Neutral"
            #echo $emotion
            ./SMILExtract -C config/emobase.conf -I $f -O $name.arff -instname $emotion -classes "{N,C,H,Sa,A,F,D,Su}" -classlabel N
            ;;
        
        *)
            echo "Sorry!"
            ;;
    esac
done

#./SMILExtract -C config/emobase.conf -I xyz.wav -O xyz1.arff -instname Neutral -classes "{Neutral,Calm,Happy,Sad,Angry,Fearful,Disgust,Surprised}" -classlabel Neutral

#./SMILExtract -C config/emobase.conf -I xyz.wav -O xyz2.arff -instname Neutral -classes "{A,N,H,S,B,D,F}" -classlabel N

#./SMILExtract -C config/emo_large.conf -I xyz.wav -O xyz3.arff -instname Neutral -classes "{A,N,H,S,B,D,F}" -classlabel N

