#!/usr/bin/env bash
sudo apt-get update
sudo apt-get install -y python3 python-pip
sudo pip install -r requirements.txt
sudo apt-get install redis-server
wget https://bitcoin.org/bin/0.9.2.1/bitcoin-0.9.2.1-linux.tar.gz
wget https://download.litecoin.org/litecoin-0.8.7.2/linux/litecoin-0.8.7.2-linux.tar.xz
tar -zxf *.tar.gz
tar -xf *.tar.xz
mkdir /home/root/.bitcoin
mkdir /home/root/.litecoin
echo "rpcuser=litecoinrpc" > /home/root/.litecoin/litecoin.conf
echo "rpcpassword=2UY1hkEMoaHrqF7SkmfkziN9HnANfNNz2uUBicbqV1wD" >> /home/root/.litecoin/litecoin.conf
echo "rpcport=7332" >> /home/root/.litecoin/litecoin.conf
echo "server=1" >> /home/root/.litecoin/litecoin.conf

echo "rpcuser=bitcoinrpc" > /home/root/.bitcoin/bitcoin.conf
echo "rpcpassword=94CpFcoCgO" >> /home/root/.bitcoin/bitcoin.conf
echo "rpcport=8332" >> /home/root/.bitcoin/bitcoin.conf
echo "server=1" >> /home/root/.bitcoin/bitcoin.conf
sudo /home/root/bitcoin-0.9.2.1-linux/bin/32/bitcoind -daemon -testnet
echo
sudo /home/root/litecoin-0.8.7.2-linux/bin/32/litecoind -daemon -testnet
echo
sudo redis-server /etc/redis/redis.conf
