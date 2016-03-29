//
//  VideoModeView.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/3/7.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "VideoModeView.h"

@interface VideoModeView ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UIButton *manualModeBtn;
@property (weak, nonatomic) IBOutlet UIButton *automaticModeBtn;

@end

@implementation VideoModeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"VideoModeView" owner:self options:nil] lastObject];
        
        self.label1.layer.cornerRadius = 7;
        self.label1.layer.masksToBounds = YES;
        self.label2.layer.cornerRadius = 7;
        self.label2.layer.masksToBounds = YES;
        
        self.manualModeBtn.layer.cornerRadius = 20;
        self.automaticModeBtn.layer.cornerRadius = 20;
        
    }
    return self;
}

@end
