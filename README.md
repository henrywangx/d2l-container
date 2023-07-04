# d2l-container

本项目主要是通过容器打包了[d2l](https://github.com/d2l-ai/d2l-zh)项目的运行环境和物料。免去搭建环境的问题，只要找到一台带显卡和driver的机器即可使用。



## 前提条件

宿主机已经安装英伟达driver。



## 运行

**本地运行：**

1.执行命令拉起容器

```bash
docker run --rm -p 8888:8888 henrywangx/d2l:v1.0
```

2.日志中会出现jupyter的访问url，例如：`http://localhost:8888/lab?token=13c789f23dfb059f802e04ce9cef3a98935526b9bcc62d3e`

3.浏览器访问jupyter的url

**k8s运行**：

1.创建pod

```bash
#创建pod
kubectl apply -f pod.yaml
```

2.查看pod日志获取url

```bash
kubectl logs xiowang-d2l |grep "http://localhost:8888"
```

3.pod forward到本地8888

```bash
kubectl port-forward xiowang-d2l 8888:8888
```

4.浏览器访问url



