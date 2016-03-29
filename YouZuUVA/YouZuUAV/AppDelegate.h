//
//  AppDelegate.h
//  FamilyTravelUAV
//
//  Created by QUAN on 16/2/29.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 *  获取当前型号
 */
- (NSString*)deviceString;

+ (instancetype)shareAppDelegate;

/**
 *  手机照片模型数组
 */
@property (nonatomic,strong) NSMutableArray *localPictureModelArrays;

/**
 *  手机视频模型数组
 */
@property (nonatomic,strong) NSMutableArray *localVideoModelArrays;

@end

