//
//  ESLocalModel.h
//  ExternalStorage
//
//  Created by Andy on 16/2/2.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESLocalModel : NSObject
/**
 *  本地照片 或 视频 的地址
 */
@property (copy, nonatomic) NSString *localUrl;
/**
 *  本地照片 或 视频 的名字
 */
@property (copy, nonatomic) NSString *localName;
/**
 *  本地照片 或 视频 的时间
 */
@property (copy, nonatomic) NSDate *localDate;
/**
 *  本地的缩略图
 */
@property (copy, nonatomic) UIImage *localAspectRatioThumbnailImage;
/**
 *  图片或视频的 大小（）
 */
@property (assign, nonatomic) CGFloat localImageSize;

@property (copy, nonatomic) NSString *fullUrlStr;

@end
