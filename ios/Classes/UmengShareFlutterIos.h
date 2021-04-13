#import <Flutter/Flutter.h>

@interface UmengShareFlutterIos : NSObject

+ (BOOL)handleOpenURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id>*)options;

@end