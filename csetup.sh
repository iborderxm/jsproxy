cd $(mktemp -d)

curl -O https://www.openssl.org/source/openssl-1.1.1b.tar.gz
tar zxf openssl-*

curl -O https://nchc.dl.sourceforge.net/project/pcre/pcre/8.43/pcre-8.43.tar.gz
tar zxf pcre-*

curl -O https://zlib.net/zlib-1.3.tar.gz
tar zxf zlib-*

curl -O https://openresty.org/download/openresty-1.15.8.1.tar.gz
tar zxf openresty-*
cd openresty-*

export PATH=$PATH:/sbin

./configure \
  --with-openssl=../openssl-1.1.1b \
  --with-pcre=../pcre-8.43 \
  --with-zlib=../zlib-1.3 \
  --with-http_v2_module \
  --with-http_ssl_module \
  --with-pcre-jit \
  --prefix=$HOME/openresty

make
make install

cd /workspaces/jsproxy
rm -rf www
git clone -b gh-pages --depth=1 https://github.com/EtherDream/jsproxy.git www

echo "setup success"
echo "./run.sh"