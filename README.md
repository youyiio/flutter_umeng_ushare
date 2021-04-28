# flutter_umeng_share

友盟分享插件 for Flutter

## flutter_umeng_share 说明：

   在最近的实际项目中测试并使用了该库，目前当前库添加了常用的微博、qq、微信这个几个库
因为Umeng分享支持的第三方平台比较多，无法一一测试；如遇到问题请issue 或 PR;

## 如何集成到我的flutter项目中？

在包管理文件pubspec.yaml中添加如下：
```
dependencies:
  flutter_umeng_share: ^1.0.0
```

### 自动配置集成

在包管理文件pubspec.yaml中添加如下：

```
dependencies:
  flutter_umeng_share:
    path: ./flutter_umeng_share 
```

### 本地集成

git clone 项目到本地后，
在包管理文件pubspec.yaml中添加如下：

```
dependencies:
  flutter_umeng_share:
    path: ./flutter_umeng_share 
```

# flutter使用方法，快速入手

## 配置初始化
```
  if (Platform.isAndroid) {
    //初始化友盟
    UMengShare.initUMConfigure("606c5c04de41b946ab3fa67a", "io.youyi.cashier");

  } else if (Platform.isIOS) {
    UMengShare.initUMConfigure("606c5c04de41b946ab3fa67a", "io.youyi.cashier");
  }
  //微信配置
    UMengShare.initPlatformConfig(UMPlatform.Wechat, "wx0a72b9202cea7d69",
        "37395a00a62d87f255b23b14217c794f");
    //QQ配置
    UMengShare.initPlatformConfig(
        UMPlatform.QQ, "1106284041", "HWol57Eo2q3UaUpS");
```

## 分享代码

```
  UMengShare.shareText(UMSharePlatform.Qzone, "test 分享");

  UMengShare.shareImage(
    UMSharePlatform.QQ,
    "https://pics3.baidu.com/feed/b3119313b07eca801b8cf7a23199d9d5a0448329.png?token=81d3401ccb1a44a9dc5adf27d2567c75",
    "https://pics3.baidu.com/feed/b3119313b07eca801b8cf7a23199d9d5a0448329.png?token=81d3401ccb1a44a9dc5adf27d2567c75",
  );

  UMengShare.shareMedia(
    UMSharePlatform.QQ,
    UMShareMediaType.WebUrl,
    "分享的标题",
    "分享的说明内容",
    "https://pics3.baidu.com/feed/b3119313b07eca801b8cf7a23199d9d5a0448329.png?token=81d3401ccb1a44a9dc5adf27d2567c75",
    "https://www.beyongx.com/",
  );
```

## 社交登录代码

```
  UMengShare.login(UMPlatform.QQ);
```

# Android平台配置 （深入了解，可参考友盟官方文档）

看文档 https://developer.umeng.com/docs/128606/detail/193879

## 1.微信回调代码


需要在主项目 > android模块 中操作：

* 新增包 ${package_name}.wxapi;
* 新建 WXCallbackActivity.java,内容如下（记得替换${package_name});
```
package ${package_name}.wxapi;

import com.umeng.socialize.weixin.view.WXCallbackActivity;

public class WXEntryActivity extends WXCallbackActivity {
}
```

## 2.QQ配置

注：该文件在本插件路径 
/android/src/main/AndroidManifest.xml
只需要改qq的appkey
```
<data android:scheme="tencent1106284041" />
```

注：需要在主项目 > android模块 中操作：
/android/app/build.gradle

```
defaultConfig {

    manifestPlaceholders = [qqappid: "1106284041"]
}
```


# IOS平台配置 （深入了解，可参考友盟官方文档）

看文档 https://developer.umeng.com/docs/128606/detail/193653

## 1.配置SSO白名单
info.plist添加：
```
	<key>LSApplicationQueriesSchemes</key>
	<array>
		<string>wechat</string>
		<string>weixin</string>
		<string>weixinULAPI</string>
		<string>mqqopensdklaunchminiapp</string>
		<string>mqqopensdkminiapp</string>
		<string>mqqapi</string>
		<string>mqq</string>
		<string>mqqOpensdkSSoLogin</string>
		<string>mqqconnect</string>
		<string>mqqopensdkdataline</string>
		<string>mqqopensdkgrouptribeshare</string>
		<string>mqqopensdkfriend</string>
		<string>mqqopensdkapi</string>
		<string>mqqopensdkapiV2</string>
		<string>mqqopensdkapiV3</string>
		<string>mqqopensdkapiV4</string>
		<string>mqzoneopensdk</string>
		<string>wtloginmqq</string>
		<string>wtloginmqq2</string>
		<string>mqqwpa</string>
		<string>mqzone</string>
		<string>mqzonev2</string>
		<string>mqzoneshare</string>
		<string>wtloginqzone</string>
		<string>mqzonewx</string>
		<string>mqzoneopensdkapiV2</string>
		<string>mqzoneopensdkapi19</string>
		<string>mqzoneopensdkapi</string>
		<string>mqqbrowser</string>
		<string>mttbrowser</string>
		<string>tim</string>
		<string>timapi</string>
		<string>timopensdkfriend</string>
		<string>timwpa</string>
		<string>timgamebindinggroup</string>
		<string>timapiwallet</string>
		<string>timOpensdkSSoLogin</string>
		<string>wtlogintim</string>
		<string>timopensdkgrouptribeshare</string>
		<string>timopensdkapiV4</string>
		<string>timgamebindinggroup</string>
		<string>timopensdkdataline</string>
		<string>wtlogintimV1</string>
		<string>timapiV1</string>
	</array>
  ```

## 2.配置URL Types

项目 targets -> info -> URL Types 中添加：

- QQ配置1： identifier: qq1, URL Schemes: tencent${qq_conn_appId}
- QQ配置2： identifier: qq2, URL Schemes: QQ${qq_conn_appId转16进制,结果不足8位前面补零}
- 微信设置：URL Schemes: ${weixin_appId}

## 3.配置Associated Domains

1) app developer后台enable Associated Domains;
2) xcode中设置 targets->Capabilites->Associated Domains，设置：applinks:your_domain;
3）your_domain根目录下配置 apple-app-site-association, 注意须https
nginx设置：
```
server {
  listen 443 ssl;
  server_name your_domain;

  # 需添加的内容，apple会进行验证，实现app之间的跳转;记得替换：${apple_team_ID}，${bundle_id},${weixin_path},${qq_conn_appid}
  location /apple-app-site-association {
    charset UTF-8;
    default_type text/html;
    return 200 '{\"applinks\":{\"apps\":[],\"details\":[{\"appID\":\"${apple_team_id}.${bundle_id}\",\"paths\":[\"/${weixin_path}/*\",\"/qq_conn/${qq_conn_appid}/*\"]}]}}';
  }

}
```
 apple提供的网页验证地址：https://search.developer.apple.com/appsearch-validation-tool/

 
## 4.配置universal link 回调设置

Object-C:
  ```
  // 支持所有iOS系统
  -(BOOL)application:(UIApplication*)application handleOpenURL:(NSURL *)url
  {
      BOOL result =[[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
      // 其他如支付等SDK的回调
    }
    return result;
  }

  -(BOOL)application:(UIApplication*)application continueUserActivity:(NSUserActivity*)userActivity restorationHandler:(void(^)(NSArray* __nullable restorableObjects))restorationHandler
  {
  if(![[UMSocialManager defaultManager] handleUniversalLink:userActivity options:nil]){
  // 其他SDK的回调
  }
  return YES;
  }
  ```
  Swift:
  ```
  //设置url/Scheme自定义的url系统回调
    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print("open url: \(url.absoluteString)")
        
        let result = UMSocialManager.default().handleOpen(url, options: options)
        if (!result) {
           // 其他如支付等SDK的回调
        }
        //let result = UmengShareFlutterIos.handleOpen(url, options: options)
        print("result: \(result)")

        return result
    }
    
    //设置Universal Links系统回调
    override func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        print("continue userActivity: \(userActivity)")
        
        let result = UMSocialManager.default().handleUniversalLink(userActivity, options: nil)
        print("result: \(result)")
        
        return true
    }
  ```


# 插件相关的功能操作


## 分享函数

在lib/umeng_share.dart可以查看到：

### 分享文本
```UMengShare.shareText(UMSharePlatform platform,String text)```
### 分享图片
```UMengShare.shareImage(UMSharePlatform platform,String thumb,String image)```
### 分享媒体
```UMengShare.shareMedia(UMSharePlatform platform,UMShareMediaType type,String title,String desc,String thumb,String link)```
### 分享小程序（只能分享给微信好友）
```UMengShare.shareMiniApp(String username,String title,String desc,String thumb,String url,String path)```
### 第三方登录
```UMengShare.login(UMPlatform platform)```
### 检测是否安装应用
```UMengShare.checkInstall(UMPlatform platform)```


## 登录函数

```
  UMengShare.login(UMPlatform.QQ);
```

## 第三方App是否安装判断

### QQ是否安装
```
UMengShare.checkInstall(UMSharePlatform.QQ);
```

### WEIXIN是否安装
```
UMengShare.checkInstall(UMSharePlatform.WECHAT);
```