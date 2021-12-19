cd ~
if [ ! -d "fqkk" ]; then
mkdir fqkk
fi
cd ~/fqkk
echo $(curl -s https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/fqfr.sh) > fqfr.sh
echo $(curl -s https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/fqfrdr.sh) > fqfrdr.sh
echo $(curl -s https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/fqfrdr2.sh) > fqfrdr2.sh
echo $(curl -s https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/fqrft.sh) > fqrft.sh
echo $(curl -s https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/fqrk.sh) > fqrk.sh
echo $(curl -s https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/fqrw.sh) > fqrw.sh
echo $(curl -s https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/fqtx.sh) > fqtx.sh
echo $(curl -s https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/fqzlm.sh) > fqzlm.sh
echo $(curl -s https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/joj.sh) > joj.sh
echo $(curl -s https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/owa.sh) > owa.sh
echo $(curl -s https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/owar.sh) > owar.sh
echo $(curl -s https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/owsq.sh) > owsq.sh
echo $(curl -s https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/roj.sh) > roj.sh
echo "$(curl -s https://raw.githubusercontent.com/shoujiyanxishe/shjb/main/fqkk/run.sh)" > run.sh
chmod +x fqfr.sh fqfrdr.sh fqfrdr2.sh fqrft.sh fqrk.sh fqrw.sh fqtx.sh fqzlm.sh joj.sh owa.sh owar.sh owsq.sh roj.sh run.sh
cd ~
echo "cd ~/fqkk && ./run.sh" > fqkk.sh
chmod +x fqkk.sh
clear
echo 番茄看看脚本已安装完毕，请关闭代理，或者关闭全局，或者分应用代理绕行Termux后，输入 ./fqkk.sh 运行脚本，注意：当天首次执行脚本需要手动阅读3次抓到的包才能使用脚本！！！
