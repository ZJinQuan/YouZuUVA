//
//  CalibrationSettingView.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/3/3.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "CalibrationSettingView.h"

@interface CalibrationSettingView ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMag;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightMag;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWieth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calibratLabelHeight;
@property (weak, nonatomic) IBOutlet UILabel *calibratLabel;
@property (weak, nonatomic) IBOutlet UILabel *calibratLabel2;

@property (weak, nonatomic) IBOutlet UIButton *CalibrationSettingBtn;

@end

@implementation CalibrationSettingView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"CalibrationSettingView" owner:self options:nil] lastObject];
        
        _CalibrationSettingBtn.layer.borderWidth = 1;
        _CalibrationSettingBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _CalibrationSettingBtn.layer.cornerRadius = 5;
        
        
        NSString *currentDevicec = [[NSUserDefaults standardUserDefaults] objectForKey:CurrentDevicec];
        
        NSLog(@"%@",currentDevicec);
        
        if ([currentDevicec isEqualToString:@"iPhone 4"]) {
            
            self.calibratLabel.font = [UIFont systemFontOfSize:15];
            self.calibratLabel2.font = [UIFont systemFontOfSize:10];
            self.imageHeight.constant = 125;
            self.imageWieth.constant = 125;
            self.calibratLabelHeight.constant = 30;
            
            self.leftMag.constant = 60;
            self.rightMag.constant = 60;
            
        }else if ([currentDevicec isEqualToString:@"iPhone 5"]){
            
            self.calibratLabel.font = [UIFont systemFontOfSize:15];
            self.calibratLabel2.font = [UIFont systemFontOfSize:11];
            self.imageHeight.constant = 125;
            self.imageWieth.constant = 125;
            self.calibratLabelHeight.constant = 30;
            
            self.leftMag.constant = 80;
            self.rightMag.constant = 80;
            
        }else if ([currentDevicec isEqualToString:@"iPhone 6"]){
            
        }else if ([currentDevicec isEqualToString:@"iPhone 6P"]){
            
            self.imageHeight.constant = 190;
            self.imageWieth.constant = 190;
            
        }else{
           
        }
        
        
    }
    return self;
}

- (IBAction)clickCalibrationSetting:(id)sender {
    
    NSLog(@"校准完成");
}

@end
