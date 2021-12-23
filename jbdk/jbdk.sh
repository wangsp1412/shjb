cd ~
read -p "输入 1 或 2 进行脚本管理
1、多开脚本：复制脚本文件夹，独立储存脚本变量常量
2、删除脚本：慎用，会删除主目录下包含输入内容的所有文件及文件夹: " jbgl
if [ -n "$jbgl" ]
then if [[ $jbgl =~ ^[0-9]+$ ]]
then if [ $jbgl -eq 1 -o $jbgl -eq 2 ]
then if [ $jbgl -eq 1 ]
then read -p "请输入需要多开的脚本文件夹名: " wjj
if [ -n "$wjj" ]
then if [ $(ls | grep -o "$wjj.*" | wc -l) -ne 0 ]
then if [ $(ls ~/$wjj | wc -l) -ne 0 ]
then read -p "请输入需要多开的脚本个数: " dks
if [ -n "$dks" ]
then if [[ $dks =~ ^[0-9]+$ ]]
then js=$(ls | sed "s/^$wjj//" | grep -o "[0-9]" | awk 'BEGIN {max = 0} {if ($1+0 > max+0) max=$1} END {print max}')
xs=$((js+1))
zhs=$((js+dks))
for ((n=xs; n<=zhs; n++))
do echo cp -r ~/$wjj ~/$wjj$n >> dk.sh
echo "cd ~/$wjj$n
./run.sh" > $wjj$n.sh
chmod +x $wjj$n.sh
sleep 0
done
chmod +x dk.sh
./dk.sh
rm -rf ~/jbdk jbdk.sh dk.sh
clear
echo $wjj多开$dks个已完成，输入 ls 查看
else clear
echo 请输入数字
fi
else clear
echo 没有输入内容
fi
else clear
echo $wjj内无脚本文件，请完整下载$wjj脚本
fi
else clear
echo 未找到$wjj文件夹，请先完整下载$wjj脚本
fi
else clear
echo 没有输入内容
fi
elif [ $jbgl -eq 2 ]
then read -p "请输入需要删除的脚本文件夹名: " wjj
if [ -n "$wjj" ]
then xswj=$(ls | grep -o "$wjj.*")
gs=$(ls | grep -o "$wjj.*" | wc -l)
rm -rf $xswj ~/jbdk jbdk.sh
clear
echo 含有$wjj的文件及文件夹共计$gs个已全部删除
else clear
echo 没有输入内容
fi
fi
else clear
echo 请输入 1 或 2
fi
else clear
echo 请输入数字
fi
else clear
echo 没有输入内容
fi
