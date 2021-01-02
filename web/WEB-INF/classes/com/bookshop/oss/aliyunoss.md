# 1. 添加OSS的SDK
# 2. 添加自己的keyid。。。。。
# 3. 到oss bucket管理，给自己授权。



# 错误
``` 
[Server]Unable to execute HTTP request: The bucket you are
attempting to access must be addressed using the specified endpoint.
Please send all future requests to this endpoint.
```   
   https://mvp.aliyun.com/zhidao/2572
   
   - 原因：您访问Bucket使用的Endpoint不正确，如果您需要了解Endpoint的详细信息，请参看OSS 基本概念。

   -  怎么找到正确的Endpoint呢？如果SDK异常抛出如下的异常，或返回如下错误：
      
```
      其中Endpoint中的oss-cn-****.aliyuncs.com就是正确的Endpoint，请使用http://oss-cn-****.aliyuncs.com或https：//oss-cn-****.aliyuncs.com作为Endpoint访问OSS。
如果错误中没有Endpoint，请登录OSS控制台，在Bucket管理中找到您访问的Bucket，单击进入Bucket概览页面。OSS域名中可以看到内网和外网域名。
外网域名是在公网上访问OSS使用的域名；内网域名是指在阿里云内部访问的OSS使用的域名。比如您在您的ECS上访问OSS，可以使用内网域名。
Endpoint是域名去掉Bucket部分，加上访问协议。例如上图中OSS的公网域名是oss-****.aliyuncs.com，它的公网Endpoint是http://oss-cn-****.aliyuncs.com；类似，内网Endpoint是http://oss-cn-****-internal.aliyuncs.com
    
```


# 访问地址
http://rain-bucket.oss-cn-beijing.aliyuncs.com/first.jpg?x-oss-process=style/one
# 图片的名字为 base64+currentTimeMillis，保证不再重复


# 在分割后缀名的时候报错，分割结果为 `[]`，空数组。
- **原因是 `. `需要转义符 `\\.`**

# 上传文件的form 
1、需要post提交
2、enctype="multipart/form-data" （传输文件）
3、需要提交的表单元素需要设置 name 属性

```

<form action="test.action" method="post" enctype="multipart/form-data">
    <div style="margin-left: 22%;float: left;width: 281px;height: 365px;padding-top: 5%">
        <div style="position: relative;">
            <!--设置input的position为absolute，使其不按文档流排版，并设置其包裹整个布局 -->
            <!-- 设置opactity为0，使input变透明 -->
            <!-- 只接受jpg，gif和png格式 -->
            <input name="image" required="required"
                   id="upload-input" style="position: absolute; top: 0; bottom: 0; left: 0;right: 0; opacity: 0;"
                   type="file" accept="image/gif, image/jpg, image/png" onchange="showImg(this)"/>
            <!-- 自定义按钮效果 -->
            <div style="text-align: top">
                <span style="font-size: 22px;">点击上传图片：</span>
                <img id="upload" src="img/shangchuan.png"
                     style="width:180px; height: 90px; vertical-align: middle;"/>
            </div>
        </div>
        <div id="imgContainer" style="margin-top: 10px;"></div>
        <p class="help-block">请上传尺寸大小为280*360的图片<br>可上传一个或多个</p>
    </div>
    <input type="submit">
</form>
```