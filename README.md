# 目标
本项目目的如下：
- 提供一份C++的项目参考
- 方便个人编写自定义库、可执行文件等
- 关注代码层面而不是边角料的事情

# TODO
- https://github.com/ttroy50/cmake-examples.git 学习
- 通过Makefile封装基本工具、编译、打包、自动运行测试程序
- 单元测试库以及开源代码，当前计划使用gtest
- 日志，封装两个glog和zlog，zlog给C使用、glog给C++使用
- 开源组件提取封装成，编译生成动态库和静态库
- 平时的可执行程序比如对外的demo放到sample目录中
- 每个模块的单元测试放到模块的子目录中
- 依赖的第三方组件放到3rdparty中，且必须是能够基于平台的自动化编译和包生成
- 增加cmd目录，专门放置一些可执行文件的代码，一般是有多个main函数


# 目录划分
```bash
fh@Feihu-3 cpp-proj-sample % tree
.
├── 3rdparty            # 第三方库
├── Makefile            # 自定义工具、命令封装等入口
├── README.md           # 帮助
├── modules             # 模块，内部存放自定义的轮子
├── samples             # 生成可执行文件的代码，一般为对外提供的demo
└── scripts             # 常见的脚本、给Makefile调用等
    └── misc.sh
```