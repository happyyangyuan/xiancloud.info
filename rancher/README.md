# based on rancher and k8s
## 单机版的rancher启动脚本推荐脚本
```bash
cd `dirname $0`
# 我这里使用的是腾讯云trustAsia CA颁发的免费证书： rancher.xiancloud.info
# rancher启动请参考： https://rancher.com/docs/rancher/v2.x/en/installation/single-node/
docker run -d --restart=unless-stopped   -p 8080:80 -p 4433:443   -v /app/ssl/Nginx/1_rancher.xiancloud.info_bundle.crt:/etc/rancher/ssl/cert.pem   -v /app/ssl/Nginx/2_rancher.xiancloud.info.key:/etc/rancher/ssl/key.pem rancher/rancher --no-cacerts
```

## 单机版日常备份

