# 整个xiancloud.info网站是基于rancher和k8s搭建的
## 单机版的rancher启动脚本推荐脚本
```bash
cd `dirname $0`
# 我这里使用的是腾讯云trustAsia CA颁发的免费证书： rancher.xiancloud.info
# rancher启动请参考： https://rancher.com/docs/rancher/v2.x/en/installation/single-node/
docker run -d --restart=unless-stopped   -p 8080:80 -p 4433:443   -v /app/ssl/Nginx/1_rancher.xiancloud.info_bundle.crt:/etc/rancher/ssl/cert.pem   -v /app/ssl/Nginx/2_rancher.xiancloud.info.key:/etc/rancher/ssl/key.pem rancher/rancher --no-cacerts
```

## 单机版日常备份
### 1、记录当前rancher版本号
v2.1.7

### 2、停止旧rancher 服务
```
docker ps 
docker stop   vibrant_haibt
```

### 3、用旧server容器新建数据容器
`docker create --volumes-from vibrant_haibt  --name rancher-data rancher/rancher:v2.0.6`

### 4、备份旧server数据容器
#### 原备份方式
~~docker create --volumes-from vibrant_haibt    \
--name rancher-data-snapshot-2.0.6 rancher/rancher:v2.0.6~~
#### rancher官方又换了一个备份历史数据的方式如下，上述方式不再使用（不过感觉新方式有点慢）
```bash
docker run  --volumes-from rancher-data -v $PWD:/backup \
alpine tar zcvf /backup/rancher-data-backup-2.1.7-20190331.tar.gz \
/var/lib/rancher
```
### 使用备份数据启动rancher
## 下载并运行新版rancher容器
```bash
docker pull rancher/rancher:latest
docker run -d --volumes-from rancher-data --restart=unless-stopped \
-p 8080:80 -p 4433:443  \
 -v /app/ssl/Nginx/1_rancher.xiancloud.info_bundle.crt:/etc/rancher/ssl/cert.pem   -v /app/ssl/Nginx/2_rancher.xiancloud.info.key:/etc/rancher/ssl/key.pem \
rancher/rancher:latest --no-cacerts
```
