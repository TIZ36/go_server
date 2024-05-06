# go_server

template goserver using gozero

## Http Server

> 因为本项目是基于GoZero [link](https://go-zero.dev/) 使用的，所以搭建一个httpserver，我们首先要定义好.api文件

### 配置和使用api模版

***api文件的句法参考gozero的官方文档*** [语法](https://go-zero.dev/docs/tutorials)

使用到的文件

1. readme同级目录的rest.api文件: 最外层的api文件，脚本执行时的聚合api文件
2. ./scripts文件夹下的rest.sh文件: restful服务生成的shell脚本
3. ./api 文件下的common.api文件: restful服务通用的类型定义

```sh
cd scripts &&
chmod +x rest.sh &&
./rest.sh api_filename
```

脚本会尝试根据api文件生成代码，并自动尝试启动http server
***ps: 如果配置都对，但是启动报: no such file or directory, 检查一下api文件里的service命名，得是api_service_name-api{...}***
