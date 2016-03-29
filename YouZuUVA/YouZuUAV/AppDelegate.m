//
//  AppDelegate.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/2/29.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "AppDelegate.h"
#import "StatementViewController.h"
#import "HomeViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>  // 获取相册资源必须导入此依赖库头文件
#import <Photos/Photos.h>
#import "ESLocalModel.h"
#import "sys/utsname.h"

#define key_ShortVersion @"key_ShortVersion"


@interface AppDelegate ()

@end

@implementation AppDelegate

+ (instancetype)shareAppDelegate {
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    return app;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    self.window.tintColor = RGB(70, 216, 207);
    
    
    NSString *localShortVersionStr = [[NSUserDefaults standardUserDefaults] objectForKey:key_ShortVersion];
    
    NSString *currentShortVersionStr = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    NSLog(@"%@",currentShortVersionStr);
    
    NSString *currentDevicec = [self deviceString];
    NSLog(@"%@",currentDevicec);
    
    [[NSUserDefaults standardUserDefaults] setObject:currentDevicec forKey:CurrentDevicec];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (!localShortVersionStr || [localShortVersionStr compare:currentShortVersionStr] == NSOrderedAscending) {
        
        //是新版本 立即保存
        [[NSUserDefaults standardUserDefaults] setObject:currentShortVersionStr forKey:key_ShortVersion];
        
        
        [[NSUserDefaults standardUserDefaults] synchronize];

        self.window.rootViewController = [[StatementViewController alloc] init];
    }else {
        
        //不是新版本 调到主页面
        self.window.rootViewController = [[HomeViewController alloc] init];
    }
    
    
    
    
    
    [self reloadImagesFromLibrary];
    return YES;
}

//获取当前版本号
- (NSString*)deviceString
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"]) return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"]) return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,4"]) return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone6,1"]) return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone6,2"]) return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone7,1"]) return @"iPhone 6P";
    if ([deviceString isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    
    return deviceString;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)reloadImagesFromLibrary {
    self.localPictureModelArrays = [NSMutableArray new];
    self.localVideoModelArrays = [NSMutableArray new];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        @autoreleasepool {
            ALAssetsLibraryAccessFailureBlock failureblock = ^(NSError *myerror){
                NSLog(@"相册访问失败 =%@", [myerror localizedDescription]);
                if ([myerror.localizedDescription rangeOfString:@"Global denied access"].location!=NSNotFound) {
                    NSLog(@"无法访问相册.请在'设置->定位服务'设置为打开状态.");
                    
                }else{
                    NSLog(@"相册访问失败.");
                }
            };
            
            __block int i = 0;
            ALAssetsGroupEnumerationResultsBlock groupEnumerAtion = ^(ALAsset *result, NSUInteger index, BOOL *stop){
                if (result!=NULL) {
                    
                    if ([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypePhoto]) {
                        
                        NSString *urlstr=[NSString stringWithFormat:@"%@",result.defaultRepresentation.url];//图片的url
                        
                        NSString *imageName = [NSString stringWithFormat:@"%@", result.defaultRepresentation.filename];
                        
                        id imageDate = [result valueForProperty:ALAssetPropertyDate];
                        
                        //                        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                        //                        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
                        //                        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
                        //                        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
                        //                        NSString *strDate = [dateFormatter stringFromDate:imageDate];
                        
                        UIImage *image = [UIImage imageWithCGImage:result.aspectRatioThumbnail];
                        NSString *fullURLStr = [NSString stringWithFormat:@"%@", result.defaultRepresentation.url];
                        
                        NSData *data = UIImagePNGRepresentation(image);
                        CGFloat dataFloat = data.length/1024/1024;
                        
                        ESLocalModel *localModel = [[ESLocalModel alloc] init];
                        localModel.localUrl = urlstr;
                        localModel.localName = imageName;
                        localModel.localDate = imageDate;
                        localModel.localAspectRatioThumbnailImage = image;
                        localModel.localImageSize = dataFloat;
                        localModel.fullUrlStr = fullURLStr;
                        [_localPictureModelArrays addObject:localModel];
                        
                        i++;
                        
                        //                        DEbugLog(@"url = %@, name = %@, imageDate = %@    i=%d", urlstr, imageName, imageDate, i);
                        
                    } else if ([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypeVideo]) {
                        NSString *urlstr=[NSString stringWithFormat:@"%@",result.defaultRepresentation.url];//图片的url
                        
                        NSString *imageName = [NSString stringWithFormat:@"%@", result.defaultRepresentation.filename];
                        
                        id imageDate = [result valueForProperty:ALAssetPropertyDate];
                        
                        //                        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                        //                        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
                        //                        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
                        //                        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
                        //                        NSString *strDate = [dateFormatter stringFromDate:imageDate];
                        
                        UIImage *image = [UIImage imageWithCGImage:result.aspectRatioThumbnail];
                        
                        NSData *data = UIImagePNGRepresentation(image);
                        CGFloat dataFloat = data.length/1024/1024;
                        //                        DEbugLog(@"url = %@, name = %@, imageDate = %@", urlstr, imageName, imageDate);
                        ESLocalModel *localModel = [[ESLocalModel alloc] init];
                        localModel.localUrl = urlstr;
                        localModel.localName = imageName;
                        localModel.localDate = imageDate;
                        localModel.localAspectRatioThumbnailImage = image;
                        localModel.localImageSize = dataFloat;
                        NSString *fullURLStr = [NSString stringWithFormat:@"%@", result.defaultRepresentation.url];
                        localModel.fullUrlStr = fullURLStr;
                        [_localVideoModelArrays addObject:localModel];
                    }
                }
                
                
            };
            
            ALAssetsLibraryGroupsEnumerationResultsBlock libraryGroupsEnumeration = ^(ALAssetsGroup* group, BOOL* stop) {
                
                if (group == nil) {
                    
                }
                
                if (group!=nil) {
                    NSString *g=[NSString stringWithFormat:@"%@",group];//获取相簿的组
                    NSLog(@"gg:%@",g);//gg:ALAssetsGroup - Name:Camera Roll, Type:Saved Photos, Assets count:71
                    
                    NSString *g1=[g substringFromIndex:16 ] ;
                    NSArray *arr=[[NSArray alloc] init];
                    arr=[g1 componentsSeparatedByString:@","];
                    NSString *g2=[[arr objectAtIndex:0] substringFromIndex:5];
                    if ([g2 isEqualToString:@"Camera Roll"]) {
                        g2=@"相机胶卷";
                    }
                    NSString *groupName=g2;//组的name
                    
                    [group enumerateAssetsUsingBlock:groupEnumerAtion];
                    
                }
                
            };
            
            ALAssetsLibrary* library = [[ALAssetsLibrary alloc] init];
            [library enumerateGroupsWithTypes:ALAssetsGroupAll
                                   usingBlock:libraryGroupsEnumeration
                                 failureBlock:failureblock];
        }
    });
}


@end
