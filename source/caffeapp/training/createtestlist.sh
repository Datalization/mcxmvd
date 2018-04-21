# /usr/bin/env sh
DATA=imgtest
echo "Create test.txt..."
rm -rf ./test.txt
find $DATA -name O*.*| cut -d '/' -f2 | sed "s/$/ 1/">>./test.txt
find $DATA -name X*.*| cut -d '/' -f2 | sed "s/$/ 2/">>./tmp.txt
cat ./tmp.txt>>./test.txt
rm -rf ./tmp.txt
echo "Done.."
