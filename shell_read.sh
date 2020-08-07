
#!/bin/bash
while read line
do
echo $line
done < filename(file to read)


#!/bin/bash
cat filename(file to read) | while read line
do
echo $line
done


for line in `cat filename(file to read)`
do
echo $line
done
