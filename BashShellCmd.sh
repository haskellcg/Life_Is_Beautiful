#!/bin/bash

# https://www.runoob.com/linux/linux-shell-variable.html

echo "hello world"

yourname="dead by daylight"
echo $yourname

readonly yourname
# unset yourname
# yourname="odyssey"

for skill in Ada Coffe Action Java; do
    echo "I am good at ${skill}Script"
done

str_single_quote='show ${yourname}'
echo $str_single_quote
str_double_quote="show ${yourname}"
echo $str_double_quote

echo ${#str_double_quote}

echo `expr index "${yourname}" l`

array_name=(value0 value1 value2 value3)
for array_item in ${array_name[@]}; do
    echo $array_item
done

array_length=${#array_name[@]}
for ((index=0; index<array_length; ++index)); do
    echo ${array_name[index]}
done

echo "number of params: $#"
echo "parameters: $*"
echo "pid: $$"
echo "last pid: $!"
echo "parameters: $@"
echo "shell set options: $-"
echo "last exit code: $?"

val=`expr 2 + 2`
echo "val is ${val}"

var_a=100
var_b=20
val=`expr $var_a - $var_b`
echo "a - b = $val"
val=`expr $var_a \* $var_b`
echo "a * b = $val"
val=`expr $var_a / $var_b`
echo "a / b = $val"
val=`expr $var_a % $var_b`
echo "a % b = $val"
if [ $var_a == $var_b ]
then
    echo "a == b"
fi
if [ $var_a != $var_b ]
then
    echo "a != b"
fi


if [ $var_a -eq $var_b ]
then
    echo "a -eq b"
else
    echo "a not -eq b"
fi
if [ $var_a -ne $var_b ]
then
    echo "a -ne b"
else
    echo "a not -ne b"
fi
if [ $var_a -gt $var_b ]
then
    echo "a -gt b"
else
    echo "a not -gt b"
fi
if [ $var_a -lt $var_b ]
then
    echo "a -lt b"
else
    echo "a not -lt b"
fi
if [ $var_a -ge $var_b ]
then
    echo "a -ge b"
else
    echo "a not -ge b"
fi
if [ $var_a -le $var_b ]
then
    echo "a -le b"
else
    echo "a not -le b"
fi

# !/-o/-a

# =/!=/-z/-n/$

# -b/-c/-d/-f/-g/-k/-p/-u/-r/-w/-x/-s/-e file

printf "%-10s %-8s %-4s\n" Name Gender Weight
printf "%-10s %-8s %-4d\n" GuoJing Male 66
printf "%-10s %-8s %-4d\n" YangGuo Male 48

funWithParam(){
    echo "第一个参数为 $1 !"
    echo "第二个参数为 $2 !"
    echo "第十个参数为 $10 !"
    echo "第十个参数为 ${10} !"
    echo "第十一个参数为 ${11} !"
    echo "参数总数有 $# 个!"
    echo "作为一个字符串输出所有参数 $* !"
}
funWithParam 1 2 3 4 5 6 7 8 9 34 73

# source other_shell_file
