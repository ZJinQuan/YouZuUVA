//
//  AirplaneModeView.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/3/7.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "AirplaneModeView.h"

@interface AirplaneModeView ()

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@end

@implementation AirplaneModeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"AirplaneModeView" owner:self options:nil] lastObject];
        
        self.label1.layer.cornerRadius = 7;
        self.label1.layer.masksToBounds = YES;
        self.label2.layer.cornerRadius = 7;
        self.label2.layer.masksToBounds = YES;
        self.label3.layer.cornerRadius = 7;
        self.label3.layer.masksToBounds = YES;
        
        
    }
    return self;
}

@end
