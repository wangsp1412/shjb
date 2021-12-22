if [ ! -s ckerror.txt -a -s jc.txt ]
then ckP=$(cat ckP.txt)
jc=$(cat jc.txt)
ju=$(cat ju.txt)
ji=$(cat ji.txt)
ua=$(cat ua.txt)
curl -k -i --raw -o rsj.txt "http://$ju/read_task/sdfec?jumpid=$ji&type=2&code=$jc&state=1" -H "Host: $ju" -H "Proxy-Connection: keep-alive" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: $ua" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" -H "Sec-Fetch-Site: same-origin" -H "Sec-Fetch-Mode: navigate" -H "Sec-Fetch-Dest: document" -H "Accept-Encoding: gunzip, deflate, br" -H "Cookie: $ckP" -H "Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7" -s
echo $(cat rsj.txt | grep -o "Location:.*" | cut -d '/' -f3) > rw.txt
fi
