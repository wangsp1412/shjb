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
rm -rf ckerror.txt
./fqrk.sh
./fqrw.sh
./fqfr.sh
./fqrft.sh
if [ -s ckerror.txt ]
then echo $(cat ckerror.txt)
fi
else ./fqrk.sh
./fqrw.sh
./fqfr.sh
./fqrft.sh
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
./fqrk.sh
./fqrw.sh
./fqfr.sh
./fqrft.sh
if [ -s ckerror.txt ]
then echo $(cat ckerror.txt)
fi
fi
./owsq.sh
while sleep 8
do
./fqfr.sh
./fqrft.sh
if [ ! -s ckerror.txt -a $(cat status.txt) -ne 4 -a $(cat status.txt) -ne 2 -a $(cat rest.txt) -ne 0 ]
then if [ -s jkey.txt ]
then ./fqfrdr2.sh
./owa.sh
./owar.sh
./joj.sh
./roj.sh
./fqrft.sh
clear
echo $(cat rft.txt)
else ./fqfrdr.sh
./owa.sh
./owar.sh
./joj.sh
./roj.sh
./fqrft.sh
clear
echo $(cat rft.txt)
fi
else rm -rf jkey.txt
if [ ! -s ckerror.txt ]
then clear
echo $(cat rft.txt)
else clear
echo $(cat ckerror.txt)
fi
fi
done
