#!/bin/bash
#exclarray=("10.77.23.127" "10.77.23.128")
exclarray=()
rm -rf ~/.ssh/known_hosts
echo $0 $1
startip=$1
ipprefix=`echo ${startip%.*}`
echo $ipprefix
startiplastnum=`echo ${startip##*.}`
echo $startiplastnum
numberofmachine=$2
lastipnum=`expr $startiplastnum + $numberofmachine`
echo $lastipnum
dirname=$3
mkdir -p ./data/runtime$3


for ((var=$startiplastnum;var<$lastipnum;var++));
do
    ip=$ipprefix.${var}
    echo $ip
    if [[ "${exclarray[@]}" =~ $ip ]];then
        echo "exclude $ip"
    else
        echo "exe runexpect.sh"
        echo $3"/initlog_"
        (expect getlogexpect.sh $ip "root" "admin" "/tmp/initlog" "./data/runtime"$3"/initlog_")
    fi
    #echo $var
done
