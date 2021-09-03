#import "UmengUshareFlutterIos.h"
#import <UMCommon/UMCommon.h>
#import <UMShare/UMShare.h>

@implementation UmengUshareFlutterIos

+ (BOOL)handleOpenURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id>*)options
{
    BOOL result =[[UMSocialManager defaultManager] handleOpenURL:url options:options];
    return result;
}

@end