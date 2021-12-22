ua=$(cat ua.txt)
ck=$(cat ck.txt)
rw=$(cat rw.txt)
curl -k -i --raw -o fqzlm.txt "http://$rw/user/zhuli" -H "Host: $rw" -H "Proxy-Connection: keep-alive" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: $ua" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" -H "Cookie: $ck" -H "Referer: http://$rw/fast_reada" -H "Accept-Encoding: gunzip, deflate" -H "Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7" -s
echo $(cat fqzlm.txt | grep -o "备用链接.*" | cut -d '=' -f2 | cut -d '"' -f1) > zlm.txt
