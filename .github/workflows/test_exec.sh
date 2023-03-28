IFS=','; read -a arr <<< "$1";
for i in "${arr[@]}"
do
ls -r | grep -x "$i"
if [ $? -eq 1 ]
then
echo -e missing\: $i
exit 1
fi
done
