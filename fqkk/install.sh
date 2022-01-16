owsq(){
ou=$(echo $owsq | grep -o "uin.*" | cut -d '&' -f1 | cut -d '=' -f2)
key=$(echo $owsq | grep -o "key.*" | cut -d '&' -f1 | cut -d '=' -f2)
ov=$(echo $owsq | grep -o "version.*" | cut -d '&' -f1 | cut -d '=' -f2)
op=$(echo $owsq | grep -o "pass_ticket.*" | cut -d ' ' -f1 | cut -d '=' -f2)
cku=$(echo $ck | grep -o "udtauth3.*")
[ $(echo $cku | grep -c ";") -eq 1 ] && cku=$(echo $cku | cut -d ';' -f1)
if [ $(echo $ou | grep -c "%3D%3D") -eq 1 ]
then ou=$(echo $ou | cut -d '%' -f1 | sed 's/$/&==/g' )
aou=$(echo $ou | cut -d '=' -f1 | sed 's/$/&%3D%3D/g')
arou=$(echo $ou | cut -d '=' -f1 | sed 's/$/&%%3D%%3D/g')
else aou=$ou
arou=$ou
fi
}
fqrw(){
curl -s -k -i --raw -o fqrw "http://$rk/" -H "Host: $rk" -H "Proxy-Connection: keep-alive" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: $ua" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" -H "Accept-Encoding: " -H "Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7"
rw=$(cat fqrw | grep -o "http.*" | cut -d '/' -f3)
}
fqzlm(){
if [ ! -z $zlm ]
then zlg=$(curl -s "http://$rw/zs?for=$zlm" -H "Host: $rw" -H "Proxy-Connection: keep-alive" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: $ua" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" -H "Cookie: $ck" -H "Accept-Encoding: " -H "Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7" | grep -o 'background)".*' | cut -d '>' -f2 | cut -d '<' -f1)
if [ ! -z $zlg ]
then zlg=为$zlg助力，
else dt=$(date '+%Y-%m-%d %H:%M:%S')
echo $dt 助力码无效，如需助力请重新运行脚本并输入正确的助力码 > ckerror
fi
fi
}
fqfr(){
curl -s -k -i --raw -o fqfr "http://$rw/fast_reada" -H "Host: $rw" -H "Proxy-Connection: keep-alive" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: $ua" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" -H "Accept-Encoding: " -H "Cookie: $ck" -H "Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7"
if [ $(grep -c 'userinfo-score"' fqfr) -eq 1 ]
then b=$(cat fqfr | grep -o 'userinfo-score".*' | cut -d ':' -f2 | cut -d '<' -f1)
[ $(echo $b | grep -c ".") -eq 1 ] && b=$(echo $b | cut -d '.' -f1)
a=$(($b/100))
zz=$(($b%100))
[ $zz -lt 10 ] && c=0$zz || c=$zz
y=$a.$c
un=$(cat fqfr | grep -o 'userinfo-name".*' | cut -d '<' -f1 | cut -d '>' -f2)
else dt=$(date '+%Y-%m-%d %H:%M:%S')
echo $dt ck无效，请重新运行脚本并输入新的常量 > ckerror
fi
}
fqrft(){
if [ ! -s ckerror ]
then curl -s -k -i --raw -o fqrft -X POST -d "readLastKey=" "http://$rw/reada/finishTask" -H "Host: $rw" -H "Proxy-Connection: keep-alive" -H "Accept: */*" -H "Origin: http://$rw" -H "X-Requested-With: XMLHttpRequest" -H "User-Agent: $ua" -H "Content-Type: application/x-www-form-urlencoded" -H "Cookie: $ck" -H "Referer: http://$rw/fast_reada" -H "Accept-Encoding: " -H "Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7"
if [ $(grep -c "data" fqrft) -eq 1 ]
then n=$(cat fqrft | grep -o "num.*" | cut -d ',' -f1 | cut -d '"' -f3)
[ -z $n ] && n=0
if [ $n -eq 0 ]
then dt=$(date '+%Y-%m-%d %H:%M:%S')
echo $dt 今日阅读次数为0，请先手动阅读1次进行微信授权 > ckerror
fi
s=$(cat fqrft | grep -o "score.*" | cut -d ',' -f1 | cut -d '"' -f3)
[ -z $s ] && s=0
rest=$(cat fqrft | grep -o "rest.*" | cut -d ',' -f1 | cut -d ':' -f2)
[ $(grep -c "msg" fqrft) -eq 0 ] && status=1 || status=$(cat fqrft | grep -o "status.*" | cut -d ',' -f1 | cut -d ':' -f2)
if [ $status -eq 1 ]
then msg1=$(cat fqrft | grep -o "msg.*" | cut -d '"' -f3 | cut -d '<' -f1)
msg2=$(cat fqrft | grep -o "msg.*" | cut -d '>' -f2 | cut -d '<' -f1)
msg3=$(cat fqrft | grep -o "msg.*" | cut -d '>' -f3 | cut -d '"' -f1)
msg=$(echo $msg1$msg2$msg3)
else msg=$(cat fqrft | grep -o "msg.*" | cut -d '"' -f3)
fi
dt=$(date '+%Y-%m-%d %H:%M:%S')
rft=$(echo $dt $un$zlg今日已阅读$n次，今日总奖励$s币，本小时剩余未阅读$rest次，当前$y可提现 $msg)
else dt=$(date '+%Y-%m-%d %H:%M:%S')
echo $dt ck无效，请重新运行脚本并输入新的常量 > ckerror
fi
fi
}
fqfrdr(){
[ ! -z $zlm ] && zs=1
r=$(awk 'BEGIN{srand();printf "%.16f\n",rand()}')
curl -s -k -i --raw -o fqfrdr "http://$rw/fast_reada/do_read?for=$zlm&zs=$zs&pageshow&r=$r&jkey=$jkey" -H "Host: $rw" -H "Proxy-Connection: keep-alive" -H "User-Agent: $ua" -H "X-Requested-With: XMLHttpRequest" -H "Accept: */*" -H "Cookie: $ck" -H "Referer: http://$rw/fast_reada/read" -H "Accept-Encoding: " -H "Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7"
if [ $(grep -c '"jkey"' fqfrdr) -eq 1 -a $(grep -c "oauth2" fqfrdr) -eq 1 ]
then jkey=$(cat fqfrdr | grep -o "jkey.*" | cut -d '"' -f3)
ja=$(cat fqfrdr | grep -o "appid.*" | cut -d '&' -f1 | cut -d '=' -f2)
ju=$(cat fqfrdr | grep -o "uri.*" | cut -d "%" -f4 | cut -c 3-)
ji=$(cat fqfrdr | grep -o "%3D.*" | cut -d '&' -f1 | cut -c 4-)
js=$(cat fqfrdr | grep -o "state.*" | cut -d '&' -f1 | cut -d '=' -f2)
else jkey=
fi
drm=$(cat fqfrdr | grep -o '"msg".*' | cut -d '"' -f4)
}
owa(){
uuid=$(curl -s -H "Host: open.weixin.qq.com" -H "upgrade-insecure-requests: 1" -H "user-agent: $ua" -H "accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" -H "sec-fetch-site: none" -H "sec-fetch-mode: navigate" -H "sec-fetch-user: ?1" -H "sec-fetch-dest: document" -H "accept-language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7" --compressed "https://open.weixin.qq.com/connect/oauth2/authorize?appid=$ja&redirect_uri=http%3A%2F%2F$ju%2Ffast_reada%2Foiejr%3Fjumpid%3D$ji&response_type=code&scope=snsapi_userinfo&state=$js&connect_redirect=1&uin=$aou&key=$key&version=$ov&pass_ticket=$op" | grep -o "&uuid.*" | cut -d '&' -f2 | cut -d '=' -f2)
if [ -z $uuid ]
then dt=$(date '+%Y-%m-%d %H:%M:%S')
echo $dt owsq常量失效，请重新运行脚本并输入新的owsq > ckerror
fi
}
owar(){
curl -s -k -i --raw -o owar "https://open.weixin.qq.com/connect/oauth2/authorize_reply?allow=1&snsapi_userinfo=on&uuid=$uuid&uin=$ou&key=$key&pass_ticket=$op&version=$ov" -H "Host: open.weixin.qq.com" -H "Connection: keep-alive" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: $ua" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" -H "Sec-Fetch-Site: same-origin" -H "Sec-Fetch-Mode: navigate" -H "Sec-Fetch-Dest: document" -H "Referer: https://open.weixin.qq.com/connect/oauth2/authorize?appid=$ja&redirect_uri=http%%3A%%2F%%2F$ju%%2Ffast_reada%%2Foiejr%%3Fjumpid%%3D$ji&response_type=code&scope=snsapi_userinfo&state=$js&connect_redirect=1&uin=$arou&key=$key&version=$ov&pass_ticket=$op" -H "Accept-Encoding: gunzip, br" -H "Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7"
jc=$(cat owar | grep -o "code.*" | cut -d '&' -f1 | cut -d '=' -f2)
}
joj(){
curl -s -k -i --raw -o joj "http://$ju/fast_reada/oiejr?jumpid=$ji&code=$jc&state=$js" -H "Host: $ju" -H "Proxy-Connection: keep-alive" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: $ua" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" -H "Sec-Fetch-Site: same-origin" -H "Sec-Fetch-Mode: navigate" -H "Sec-Fetch-Dest: document" -H "Accept-Encoding: " -H "Cookie: $ckP; $cku" -H "Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7"
rw=$(cat joj | grep -o "Location:.*" | cut -d '/' -f3)
}
roj(){
curl -s "http://$rw/fast_reada/oiejr?jumpid=$ji&code=$jc&state=$js" -H "Host: $rw" -H "Proxy-Connection: keep-alive" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: $ua" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" -H "Sec-Fetch-Site: same-origin" -H "Sec-Fetch-Mode: navigate" -H "Sec-Fetch-Dest: document" -H "Accept-Encoding: " -H "Cookie: $ck" -H "Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7"
}
djs(){
for ((i=10;i>0;i--))
do
clear
echo "$rft
阅读中，等待$i秒"
sleep 1
done
echo $drm
}
rm -rf ckerror
read -p "请输入ck: " ck
read -p "请输入ua: " ua
read -p "请输入owsq: " owsq
read -p "请输入ckP: " ckP
read -p "请输入助力码，不需要助力则回车: " zlm
owsq
rk=$(curl -Ls http://m.hg365.top/entry | grep -o "url_h5 =.*" | cut -d '/' -f3 | sed 's/...$//')
fqrw
fqfr
fqzlm
fqrft
while sleep 0
do
if [ ! -s ckerror ]
then if [ $status -ne 4 -a $status -ne 2 -a $rest -ne 0 ]
then fqfrdr
owa
owar
joj
roj
djs
fqrft
clear
echo $rft
fi
else clear
echo $(cat ckerror)
fi
done
