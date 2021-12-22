cd ~
read -p "如你确认已安装wget，请输入脚本地址开始安装脚本: " url
echo $url > url.txt
if [ $(grep -c "http" url.txt) -eq 0 ]
then rm -rf url.txt
echo 脚本地址未包含http://，请重新运行脚本
elif [ $(grep -c "raw" url.txt) -eq 0 ]
then rm -rf url.txt
echo 脚本地址不是包含raw的直链，请重新运行脚本
elif [ $(grep -c "shoujiyanxishe" url.txt) -eq 0 ]
then rm -rf url.txt
echo 你确定这是我耳兔的脚本吗？别玩我了
elif [ $(grep -c "install" url.txt) -eq 0 ]
then rm -rf url.txt
echo 真粗心，这可不是安装脚本的地址哦
fi
if [ -s url.txt ]
then wurl=$(echo ${url%install*})
wjj=$(echo ${wurl#*main/} | cut -d '/' -f1)
if [ $(grep -c "github" url.txt) -eq 1 ]
then ls=$(echo ${wurl%/main/*})
ck=$(echo ${ls#*com/})
if [ ! -d "$wjj" ]
then mkdir $wjj
fi
echo https://github.com/$ck/tree/main/$wjj > ~/$wjj/curl.txt
elif [ $(grep -c "gitee" url.txt) -eq 1 ]
then ls=$(echo ${wurl%/raw/*})
ck=$(echo ${ls#*com/})
if [ ! -d "$wjj" ]
then mkdir $wjj
fi
echo https://gitee.com/$ck/tree/main/$wjj > ~/$wjj/curl.txt
fi
cd ~/$wjj
jbm=$(echo $(curl -s $(cat curl.txt) | grep -o "$ck/blob.*" | cut -d '"' -f1 | cut -d '/' -f6))
rm -rf $jbm
echo "$(curl -s $(cat curl.txt) | grep -o "$ck/blob.*" | cut -d '"' -f1 | cut -d '/' -f6 | sed 's#^#wget '''$wurl'''&#g')" > wjb.sh
chmod +x wjb.sh
./wjb.sh
chmod +x $jbm
rm -rf curl.txt install.sh wjb.sh
cd ~
rm -rf url.txt
echo "cd ~/$wjj
./run.sh" > $wjj.sh
chmod +x $wjj.sh
clear
echo 脚本已安装完毕，请输入 ./$wjj.sh 运行脚本
fi
