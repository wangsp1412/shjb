if [ ! -s ckerror.txt -a -s jkey.txt ]
then ja=$(cat ja.txt)
ju=$(cat ju.txt)
ji=$(cat ji.txt)
aou=$(cat aou.txt)
key=$(cat key.txt)
ov=$(cat ov.txt)
op=$(cat op.txt)
ua=$(cat ua.txt)
uuid=$(curl -H "Host: open.weixin.qq.com" -H "upgrade-insecure-requests: 1" -H "user-agent: $ua" -H "accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" -H "sec-fetch-site: none" -H "sec-fetch-mode: navigate" -H "sec-fetch-user: ?1" -H "sec-fetch-dest: document" -H "accept-language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7" -s --compressed "https://open.weixin.qq.com/connect/oauth2/authorize?appid=$ja&redirect_uri=http%3A%2F%2F$ju%2Fread_task%2Fsdfec%3Fjumpid%3D$ji%26type%3D2&response_type=code&scope=snsapi_userinfo&state=1&connect_redirect=1&uin=$aou&key=$key&version=$ov&pass_ticket=$op" | grep -o "&uuid.*" | cut -d '&' -f2 | cut -d '=' -f2)
echo $uuid > uuid.txt
uuid=$(cat uuid.txt)
if [ ! -n "$uuid" ]
then dt=$(date '+%Y-%m-%d %H:%M:%S')
echo $dt owsq常量失效，请重新运行脚本并输入新的owsq > ckerror.txt
fi
fi
