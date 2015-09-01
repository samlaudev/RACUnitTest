# RACUnitTest
<div style="text-align: center">
<img src="https://raw.githubusercontent.com/samlaudev/RACUnitTest/master/ScreenShots/登录情景.gif"/>
</div>


在ReactiveCocoa中**登录情景**和**抓取网络数据并显示情景**使用[kiwi]()进行单元测试案例

## Moco模拟服务
[Moco](https://github.com/dreamhead/moco)是一个可以轻松搭建测试服务器的工具。


###安装
如果你是使用Mac或Linux，可以尝试一下步骤：

1. 确定你安装JDK 6以上
2. 下载[脚本](https://github.com/dreamhead/moco/blob/master/moco-shell/moco?raw=true)
3. 把它放在你的**$PATH**路径
4. 设置它可以执行(chmod 755 ~/bin/moco)

现在你可以运行一下命令测试安装是否成功

1. 编写配置文件foo.json，内容如下：
 
 ```
 [
      {
        "response" :
          {
            "text" : "Hello, Moco"
          }
      }
 ]
 ```

2. 运行Moco HTTP服务器
`moco start -p 12306 -c foo.json`

3. 打开浏览器访问`http://localhost:12306`，你回看见"Hello, Moco"

###配置IP
由于这里使用的是本地服务，所以很有可能需要修改本地IP地址，先找到本机的IP。

![](https://raw.githubusercontent.com/samlaudev/RACUnitTest/master/ScreenShots/本地IP.png)

然在`URLHelper`类中修改BaseURL的IP字段。

![](https://raw.githubusercontent.com/samlaudev/RACUnitTest/master/ScreenShots/修改IP.png)


###启动服务
将路径跳转到**RACUnitTest/RACUnitTest/JSON**目录，找到settings.json文件，使用命令行来启动服务：
`moco start -p 12306 -g settings.json`

###使用Paw验证是否配置成功
![Send request to Local Server.png](https://raw.githubusercontent.com/samlaudev/RACUnitTest/master/ScreenShots/paw验证是否访问成功.png)

###运行测试
