./getlog.sh start_ip numberofmachines runtimeNum

start_ip:the first machine you want to get log from.
    example:10.77.23.127
numberofmachines:the number of machines which you want to get log.Example:20. So machines cover 10.77.23.127-10.77.23.146

runtimeNum: which times the script capture data. such as 8. this is 8th capture the target machines log. and put the log into ./data/runtime8/*

totally:

./getlog.sh 10.77.23.127 20 8