//
//  ImageOrVideoCell.h
//  FamilyTravelUAV
//
//  Created by QUAN on 16/3/1.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ESLocalModel;

@interface ImageOrVideoCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (strong, nonatomic) ESLocalModel *localPictureMode;

@end
