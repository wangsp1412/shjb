rw=$(cat rw.txt)
zlm=$(cat zlm.txt)
ua=$(cat ua.txt)
ck=$(cat ck.txt)
curl -k -i --raw -o fqzlm.txt "http://$rw/zs?for=$zlm" -H "Host: $rw" -H "Proxy-Connection: keep-alive" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: $ua" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" -H "Cookie: $ck" -H "Accept-Encoding: gunzip, deflate" -H "Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7" -s
if [ $(grep -c "alert" fqzlm.txt) -eq 0 ]
then if [ $(grep -c 'background)".*' fqzlm.txt) -eq 1 ]
then echo 为 $(cat fqzlm.txt | grep -o 'background)".*' | cut -d '>' -f2 | cut -d '<' -f1) 助力 > zlg.txt
fi
else dt=$(date '+%Y-%m-%d %H:%M:%S')
echo $dt 助力码无效，如需助力请重新运行脚本并输入正确的助力码 > ckerror.txt
fi
