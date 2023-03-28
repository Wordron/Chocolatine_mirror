#!/bin/bash

EXECUTABLES=test.sh,chocolatine.yml; IFS=','; read -a arr <<< "$EXECUTABLES";
for i in "${arr[@]}"
do
    ls -r | grep -x "$i"
    if [ $? -eq 1 ]
    then
        exit 1
    fi
done


echo -e "IFS=','; read -a arr <<< \"\$1\";\nfor i in \"\${arr[@]}\"\ndo\nls -r | grep -x \"\$i\"\nif [ \$? -eq 1 ]\nthen\necho -e "missing \$i"\nexit 1\nfi\ndone" > test_two.sh