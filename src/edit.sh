#!/bin/bash

echo "Введите путь и название файла."
read name
if [ -f $name ]
then
echo "Введите текст для замены."
read text
echo "Введите заменяемую строку."
read line
sed -i "s/$text/$lineS/g" $name
echo "$name - $(du -h $name | cut -f1) - $(date '+%Y-%m-%d %H:%M') - $(sha256sum $name | awk '{print $1}') - sha256" >> src/files.log
else
echo "Файл не найден."
fi
