cd ~
if [ ! -d "10s" ]; then
mkdir 10s
fi
cd ~/10s
rm -rf 10sh.sh 10srk.sh 10srtdr.sh 10srtdr2.sh 10srw.sh 10stx.sh owa.sh owar.sh owsq.sh rpc.sh rsj.sh run.sh
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/10s/10sh.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/10s/10srk.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/10s/10srtdr.sh.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/10s/10srtdr2"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/10s/10srw.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/10s/10stx.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/10s/owa.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/10s/owar.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/10s/owsq.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/10s/rpc.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/10s/rsj.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/10s/run.sh"
chmod +x 10sh.sh 10srk.sh 10srtdr.sh 10srtdr2.sh 10srw.sh 10stx.sh owa.sh owar.sh owsq.sh rpc.sh rsj.sh run.sh
cd ~
echo "cd ~/10s && ./run.sh" > 10s.sh
chmod +x 10s.sh
clear
echo 10秒阅读脚本已安装完毕，请关闭代理，或者关闭全局，或者分应用代理绕行Termux后，输入 ./10s.sh 运行脚本，注意：当天首次执行脚本需要手动阅读3次抓到的包才能使用脚本！！！
