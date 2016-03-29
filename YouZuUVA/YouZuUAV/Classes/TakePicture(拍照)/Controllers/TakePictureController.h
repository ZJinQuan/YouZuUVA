//
//  TakePictureController.h
//  FamilyTravelUAV
//
//  Created by QUAN on 16/3/1.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TakePictureController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *preview;

@property(nonatomic, getter = isPVRun) BOOL PVRun;

@end
