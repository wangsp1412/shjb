ua=$(cat ua.txt)
ck=$(cat ck.txt)
rw=$(cat rw.txt)
b=$(cat b.txt)
curl -k -i --raw -o fqtx.txt -X POST -d "amount=$b" "http://$rw/withdrawal/doWithdraw" -H "Host: $rw" -H "Proxy-Connection: keep-alive" -H "Accept: */*" -H "Origin: http://$rw" -H "X-Requested-With: XMLHttpRequest" -H "User-Agent: $ua" -H "Content-Type: application/x-www-form-urlencoded" -H "Cookie: $ck" -H "Referer: http://$rw/withdrawal/" -H "Accept-Encoding: gunzip, deflate" -H "Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7" -s
c=$(cat fqtx.txt | grep -o "code.*" | cut -d ',' -f1 | cut -d ':' -f2)
if [ $c -eq 0 ]
then dt=$(date '+%Y-%m-%d %H:%M:%S')
echo $dt 提现成功 > tx.txt
else dt=$(date '+%Y-%m-%d %H:%M:%S')
msg=$(cat fqtx.txt | grep -o "msg.*" | cut -d '"' -f3)
echo $dt 提现失败，$msg > tx.txt
fi
