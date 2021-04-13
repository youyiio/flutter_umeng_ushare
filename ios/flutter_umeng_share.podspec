#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_umeng_share'
  s.version          = '0.0.1'
  s.summary          = 'flutter_umeng_share is A flutter plugin project for Umeng share library.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.dependency 'UMCommon'
  s.dependency 'UMDevice'
  s.dependency 'UMCCommonLog'
  
  s.dependency 'UMShare/UI'
  #集成微信(完整版14.4M)
  s.dependency 'UMShare/Social/WeChat'
  #集成QQ/QZone/TIM(完整版7.6M)
  s.dependency 'UMShare/Social/QQ'
  #集成新浪微博(完整版25.3M)
  #s.dependency 'UMShare/Social/Sina'
  #集成新浪微博(精简版1M)
  #s.dependency 'UMShare/Social/ReducedSina'
  #集成钉钉
  #s.dependency 'UMShare/Social/DingDing'
  #s.dependency 'UMShare/Social/WeChatWork'
  #企业微信
  #s.dependency 'UMShare/Social/DouYin'
  #s.dependency 'UMShare/Social/AlipayShare'
  s.ios.deployment_target = '8.0'
  s.static_framework = true
end

