#!/bin/bash

## 单机版的rancher启动脚本推荐脚本

cd `dirname $0`

# 我这里使用的是自行从CA办法的证书
# 证书文件请自行获取，阿里云，腾讯云均有提供免费ssl证书，使用letsencrypt也可以制作证书
# 参考： https://rancher.com/docs/rancher/v2.x/en/installation/single-node/
docker run -d --restart=unless-stopped   -p 8080:80 -p 4433:443   -v /app/ssl/Nginx/1_rancher.xiancloud.info_bundle.crt:/etc/rancher/ssl/cert.pem   -v /app/ssl/Nginx/2_rancher.xiancloud.info.key:/etc/rancher/ssl/key.pem rancher/rancher --no-cacerts


# 使用备份数据启动rancher
## 下载并运行新版rancher容器
docker pull rancher/rancher:latest
docker run -d --volumes-from rancher-data --restart=unless-stopped \
-p 8080:80 -p 4433:443  \
 -v /app/ssl/Nginx/1_rancher.xiancloud.info_bundle.crt:/etc/rancher/ssl/cert.pem   -v /app/ssl/Nginx/2_rancher.xiancloud.info.key:/etc/rancher/ssl/key.pem \
rancher/rancher:latest --no-cacerts
