## zkui
zkui是zookeeper的一个开源的dashboard，我们使用它作为xiancloud的配置中心和注册中心管理面板

### 部署
#### zkui配置文件
[configmap.yaml文件](zkui/configmap.yaml)是zkui的配置文件完整内容。

#### zkui deployment
[deployment.yaml](deployment.yaml)zkui deployment配置文件

#### zkui service
[zkui service](zkui-service-nodeport.yaml)配置文件

#### 使用kubectl拉起上述资源
[脚本内容](kubectl-create.sh)


