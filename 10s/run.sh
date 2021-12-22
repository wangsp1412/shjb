if [ -s ck.txt -a -s ua.txt -a -s owsq.txt -a -s ckP.txt ]
then read -t 5 -p "已存在必须常量，请在5秒内输入y重新输入必须常量，输入其他或不输入则用已存在的必须常量继续。: " ready
if [[ $ready == y || $ready == Y ]]
then read -p "请输入ck: " ck
read -p "请输入ua: " ua
read -p "请输入owsq: " owsq
read -p "请输入ckP: " ckP
echo $ck > ck.txt
echo $ua > ua.txt
echo $owsq > owsq.txt
echo $ckP > ckP.txt
rm -rf ckerror.txt rf.txt
./10srk.sh
./10srw.sh
./10sh.sh
./owsq.sh
if [ -s ckerror.txt ]
then echo $(cat ckerror.txt)
fi
else ./10srk.sh
./10srw.sh
./10sh.sh
./owsq.sh
if [ -s ckerror.txt ]
then echo $(cat ckerror.txt)
fi
fi
else echo 未检测到必须常量
read -p "请输入ck: " ck
read -p "请输入ua: " ua
read -p "请输入owsq: " owsq
read -p "请输入ckP: " ckP
echo $ck > ck.txt
echo $ua > ua.txt
echo $owsq > owsq.txt
echo $ckP > ckP.txt
./10srk.sh
./10srw.sh
./10sh.sh
./owsq.sh
if [ -s ckerror.txt ]
then echo $(cat ckerror.txt)
fi
fi
while sleep 8
do
./10sh.sh
if [ ! -s ckerror.txt -a ! -s rf.txt ]
then if [ -s jkey.txt ]
then ./10srtdr2.sh
./owa.sh
./owar.sh
./rsj.sh
./rpc.sh
./10sh.sh
clear
echo $(cat h.txt)
else ./10srtdr.sh
./owa.sh
./owar.sh
./rsj.sh
./rpc.sh
./10sh.sh
clear
echo $(cat h.txt)
fi
else rm -rf jkey.txt
if [ ! -s ckerror.txt ]
then clear
echo $(cat h.txt)
else clear
echo $(cat ckerror.txt)
fi
fi
done
