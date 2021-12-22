cd ~
read -p "请输入需要多开的脚本文件夹名: " wjj
if [ $(ls | grep -o "$wjj.*" | wc -l) -ne 0 ]
then if [ $(ls ~/$wjj | wc -l) -ne 0 ]
then read -p "请输入需要多开的脚本个数: " dks
js=$(ls | sed "s/^$wjj//" | awk 'BEGIN {max = 0} {if ($1+0 > max+0) max=$1} END {print max}')
xs=$((js+1))
zhs=$((js+dks))
for ((n=$xs; n<=$zhs; n++))
do echo cp -r ~/$wjj ~/$wjj$n >> dk.sh
echo "cd ~/$wjj$n
./run.sh" > $wjj$n.sh
chmod +x $wjj$n.sh
sleep 0
done
chmod +x dk.sh
./dk.sh
rm -rf dk.sh
echo $wjj多开$dks个已完成，输入 ls 查看
else echo $wjj内无脚本文件，请完整下载$wjj脚本
fi
else echo 未找到$wjj文件夹，请先完整下载$wjj脚本
fi
