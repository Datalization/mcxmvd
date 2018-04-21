# /usr/bin/env sh
DATA=images
echo "Create train.txt..."
rm -rf ./train.txt
find $DATA -name O*.*| cut -d '/' -f2 | sed "s/$/ 1/">>./train.txt
find $DATA -name X*.*| cut -d '/' -f2 | sed "s/$/ 2/">>./tmp.txt
cat ./tmp.txt>>./train.txt
rm -rf ./tmp.txt
echo "Done.."
