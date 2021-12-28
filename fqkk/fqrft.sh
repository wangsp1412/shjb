if [ ! -s ckerror.txt ]
then ua=$(cat ua.txt)
ck=$(cat ck.txt)
rw=$(cat rw.txt)
curl -k -i --raw -o fqrft.txt -X POST -d "readLastKey=" "http://$rw/reada/finishTask" -H "Host: $rw" -H "Proxy-Connection: keep-alive" -H "Accept: */*" -H "Origin: http://$rw" -H "X-Requested-With: XMLHttpRequest" -H "User-Agent: $ua" -H "Content-Type: application/x-www-form-urlencoded" -H "Cookie: $ck" -H "Referer: http://$rw/fast_reada" -H "Accept-Encoding: gunzip, deflate" -H "Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7" -s
n=$(cat fqrft.txt | grep -o "num.*" | cut -d ',' -f1 | cut -d '"' -f3)
s=$(cat fqrft.txt | grep -o "score.*" | cut -d ',' -f1 | cut -d '"' -f3)
if [ ! -n "$s" ]
then s=0
fi
echo $(cat fqrft.txt | grep -o "rest.*" | cut -d ',' -f1 | cut -d ':' -f2) > rest.txt
if [ $(grep -c "msg" fqrft.txt) -eq 0 ]
then status=1
else status=$(cat fqrft.txt | grep -o "status.*" | cut -d ',' -f1 | cut -d ':' -f2)
fi
if [ $status -eq 1 ]
then msg1=$(cat fqrft.txt | grep -o "msg.*" | cut -d '"' -f3 | cut -d '<' -f1)
msg2=$(cat fqrft.txt | grep -o "msg.*" | cut -d '>' -f2 | cut -d '<' -f1)
msg3=$(cat fqrft.txt | grep -o "msg.*" | cut -d '>' -f3 | cut -d '"' -f1)
msg=$(echo $msg1$msg2$msg3)
else msg=$(cat fqrft.txt | grep -o "msg.*" | cut -d '"' -f3)
fi
dt=$(date '+%Y-%m-%d %H:%M:%S')
if [ -s zlm.txt ]
then zlg=$(cat zlg.txt)
fi
echo $dt $zlg今日已阅读$n次，今日总奖励$s币，本小时剩余未阅读$(cat rest.txt)次，当前$(cat y.txt)可提现 $msg > rft.txt
echo $status > status.txt
fi
