r=$(awk 'BEGIN{srand();printf "%.16f\n",rand()}')
ua=$(cat ua.txt)
ck=$(cat ck.txt)
rw=$(cat rw.txt)
curl -k -i --raw -o 10srtdr.txt "http://$rw/read_task/do_read?type=2&pageshow&r=$r" -H "Host: $rw" -H "Proxy-Connection: keep-alive" -H "User-Agent: $ua" -H "X-Requested-With: XMLHttpRequest" -H "Accept: */*" -H "Cookie: $ck" -H "Referer: http://$rw/read_task/read?type=2" -H "Accept-Encoding: gunzip, deflate" -H "Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7" -s
if [ $(grep -c "finish&type=2&upuid=" 10srtdr.txt) -eq 0 ]
then jkey=$(cat 10srtdr.txt | grep -o "jkey.*" | cut -d '"' -f3)
if [ -n "$jkey" ]
then echo $jkey > jkey.txt
else rm -rf jkey.txt
fi
echo $(cat 10srtdr.txt | grep -o "appid.*" | cut -d '&' -f1 | cut -d '=' -f2) > ja.txt
echo $(cat 10srtdr.txt | grep -o "uri.*" | cut -d "%" -f4 | cut -c 3-) > ju.txt
echo $(cat 10srtdr.txt | grep -o "%3D.*" | cut -d '%' -f2 | cut -c 3-) > ji.txt
else dt=$(date '+%Y-%m-%d %H:%M:%S')
echo $dt 您已达到本小时上限，请一个小时后再来 > rf.txt
fi
