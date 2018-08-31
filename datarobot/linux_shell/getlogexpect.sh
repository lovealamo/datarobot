#!/usr/bin/expect
set timeout  6000000
set ip     [lindex $argv 0]
set username [lindex $argv 1]
set password [lindex $argv 2]
set src_file [lindex $argv 3]
set dest_file [lindex $argv 4]


#scp -r xu.huang@10.14.8.2:/home/xu.huang/getlog.sh .
spawn scp -r $username@$ip:$src_file $dest_file$ip
 expect {
 "(yes/no)?"
  {
    send "yes\n"
    expect "*assword:" { send "$password\n"}
  }
 "*assword:"
  {
    send "$password\n"
  }
}
expect "100%"
expect eof
interact
