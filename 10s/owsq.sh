echo $(cat owsq.txt | grep -o "uin.*" | cut -d '&' -f1 | cut -d '=' -f2) > ou.txt
echo $(cat owsq.txt | grep -o "key.*" | cut -d '&' -f1 | cut -d '=' -f2) > key.txt
echo $(cat owsq.txt | grep -o "version.*" | cut -d '&' -f1 | cut -d '=' -f2) > ov.txt
echo $(cat owsq.txt | grep -o "pass_ticket.*" | cut -d ' ' -f1 | cut -d '=' -f2) > op.txt
echo $(cat ck.txt | grep -o "udtauth3.*") > cku.txt
if [ $(grep -c ";" cku.txt) -eq 1 ]
then echo $(cat cku.txt | cut -d ';' -f1) > cku.txt
fi
if [ $(grep -c "%3D%3D" ou.txt) -eq 1 ]
then echo $(cat ou.txt | cut -d '%' -f1 | sed 's/$/&==/g' ) > ou.txt
echo $(cat ou.txt | cut -d '=' -f1 | sed 's/$/&%3D%3D/g') > aou.txt
echo $(cat ou.txt | cut -d '=' -f1 | sed 's/$/&%%3D%%3D/g') > arou.txt
else echo $(cat ou.txt) > aou.txt
echo $(cat ou.txt) > arou.txt
fi
cku=$(cat cku.txt)
if [ ! -n "$cku" ]
then rm -rf cku.txt
fi
