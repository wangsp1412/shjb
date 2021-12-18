cd ~
if [ ! -d "fqkk" ]; then
mkdir fqkk
fi
cd ~/fqkk
rm -rf fqfr.sh fqfrdr.sh fqfrdr2.sh fqrft.sh fqrk.sh fqrw.sh fqtx.sh fqzlm.sh joj.sh owa.sh owar.sh owsq.sh roj.sh run.sh
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/fqfr.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/fqfrdr.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/fqfrdr2.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/fqrft.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/fqrk.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/fqrw.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/fqtx.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/fqzlm.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/joj.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/owa.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/owar.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/owsq.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/roj.sh"
wget -N "https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/run.sh"
chmod +x fqfr.sh fqfrdr.sh fqfrdr2.sh fqrft.sh fqrk.sh fqrw.sh fqtx.sh fqzlm.sh joj.sh owa.sh owar.sh owsq.sh roj.sh run.sh
cd ~
echo "cd ~/fqkk && ./run.sh" > fqkk.sh
chmod +x fqkk.sh
clear
echo 番茄看看脚本已安装完毕，请关闭代理，或者关闭全局，或者分应用绕行Termux后，输入./fqkk.sh运行脚本
