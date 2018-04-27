apt-get -y install  shadowsocks-libev

# install chinadns
wget https://github.com/shadowsocks/ChinaDNS/releases/download/1.3.2/chinadns-1.3.2.tar.gz

tar xf chinadns-1.3.2.tar.gz
cd chinadns-1.3.2/
./configure
make && make install

## chinadns 相关文件
mkdir /etc/chinadns/
cp -af chnroute.txt /etc/chinadns/

## 获取 dnsforwarder 源码
git clone https://github.com/holmium/dnsforwarder.git

## 编译 dnsforwarder
cd dnsforwarder/
./configure
make && make install

## 初始化 dnsforwarder
dnsforwarder -p
cp -af default.config ~/.dnsforwarder/config

#ipset
apt-get -y install ipset

#haveged
apt-get -y install haveged
