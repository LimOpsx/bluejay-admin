![](https://www.hualigs.cn/image/60acc4cd2a485.jpg)
##Bluejay-admin是什么?
一个SpringCloud搭建的微服务脚手架
权限部分使用了国人做的 Sa-Token框架,十分简洁且易懂
整合了网关,和sentinel 接口控制

##Bluejay-admin项目结构

```
├─bluejay-bc 其他业务组件
├─bluejay-cb 核心业务组件
│  ├─bluejay-cb-sa 处理服务接口管控
│  └─bluejay-cb-uaa 系统业务接口模块
├─bluejay-gc
│  ├─bluejay-gc-annotation 通用注解模块
│  ├─bluejay-gc-aop 通用切面模块
│  ├─bluejay-gc-constant 通用常量模块
│  ├─bluejay-gc-core 通用核心模块
│  ├─bluejay-gc-exception 通用异常模块
│  └─bluejay-gc-model 通用实体模块
├─bluejay-mca 运维监控模块
│  └─bluejay-mca-database 数据库监控模块 
├─bluejay-sii 业务内部接口服务模块
│  └─bluejay-sii-uaa 系统业务内部服务接口模块
├─bluejay-tc 技术组件扩展模块
│  ├─bluejay-tc-feign feign技术模块扩展
│  ├─bluejay-tc-gateway 网关技术模块
│  ├─bluejay-tc-mybatis mybatis配置模块
│  ├─bluejay-tc-security 关于安全框架的
│  └─bluejay-tc-sentinel 流控扩展代码模块
└─sql

```

##Bluejay-admin有哪些功能？

* 基础用户权限
* 前端UI代码:(https://gitee.com/opsx/bluejay-admin-ui) 
* ...

##已经将sentinel改造完成

* 实现规则基于nacos持久化,PULL和PUSH模式都已实现。
* 监控数据持久化到时序数据库TDengine
* 改造后的代码地址: [sentinel持久化](https://gitee.com/opsx/sentinel-persistence)

##有问题反馈
在使用中有任何问题，欢迎反馈给我，可以用以下联系方式跟我交流

* 邮件(linenhuidq@foxmail.com)

或者提问题评论都可以。

##感激
感谢以下的项目,排名不分先后

* [Sa-Token](http://sa-token.dev33.cn/)
* [TDengine](https://www.taosdata.com/)

##关于作者

```javascript
爱瞎鼓捣的菜鸡
```

