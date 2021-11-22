#!/bin/bash

# Just run this file and you can test your circ files!
# Make sure your files are in the directory above this one though!
# Credits to William Huang
if [ "$#" -eq 0 ]; then
  PART="all"
elif [ "$#" -gt 0 ]; then
  PART="$1"
fi

if [ "$#" -eq 2 ]; then
  SUFFIX="_$2"
fi

PARTS=("alu" "regfile")
for p in ${PARTS[@]}; do
  if [ $PART = $p ] || [ $PART = "all" ]; then
    FILE="${p}${SUFFIX}.circ"
    echo "Copy $FILE to tests/"
    cp $FILE tests/${p}_tests/${p}.circ
  fi
done


cd tests
rm -rf student_output
mkdir student_output
python3 ./test.py ${PART}
cd ..
