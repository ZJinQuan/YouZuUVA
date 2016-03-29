//
//  TakePictPatternView.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/3/4.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "TakePictPatternView.h"

@interface TakePictPatternView ()
@property (weak, nonatomic) IBOutlet UIButton *norPhotographBtn;
@property (weak, nonatomic) IBOutlet UIButton *cameraTimerBtn;
@property (weak, nonatomic) IBOutlet UIButton *continuousShootingBtn;
@property (weak, nonatomic) IBOutlet UIButton *delayedPhotoBtn;

@end

@implementation TakePictPatternView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"TakePictPatternView" owner:self options:nil] lastObject];
        
        self.layer.cornerRadius = 10;
        [self clickNorPhotographBtn:self.norPhotographBtn];
        
        NSString *currentDevicec = [[NSUserDefaults standardUserDefaults] objectForKey:CurrentDevicec];
    
        if ([currentDevicec isEqualToString:@"iPhone 4"]) {
            
            self.norPhotographBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            self.cameraTimerBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            self.continuousShootingBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            self.delayedPhotoBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            
        }else if ([currentDevicec isEqualToString:@"iPhone 5"]){
            

            
        }else if ([currentDevicec isEqualToString:@"iPhone 6"]){
            
        }else if ([currentDevicec isEqualToString:@"iPhone 6P"]){
            
            
        }else{
            
            
        }
        
    }
    return self;
}

#pragma mark 正常拍照
- (IBAction)clickNorPhotographBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    sender.layer.cornerRadius = 10;
    
    if (sender.selected) {
        
        self.cameraTimerBtn.selected = NO;
        self.continuousShootingBtn.selected = NO;
        self.delayedPhotoBtn.selected = NO;
        
        [sender setBackgroundColor:RGB(17, 115, 113)];
        [self.cameraTimerBtn setBackgroundColor:[UIColor clearColor]];
        [self.continuousShootingBtn setBackgroundColor:[UIColor clearColor]];
        [self.delayedPhotoBtn setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark 定时拍照
- (IBAction)clickCameraTimerBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    sender.layer.cornerRadius = 10;
    
    if (sender.selected) {
        
        self.norPhotographBtn.selected = NO;
        self.continuousShootingBtn.selected = NO;
        self.delayedPhotoBtn.selected = NO;
        
        [sender setBackgroundColor:RGB(17, 115, 113)];
        [self.norPhotographBtn setBackgroundColor:[UIColor clearColor]];
        [self.continuousShootingBtn setBackgroundColor:[UIColor clearColor]];
        [self.delayedPhotoBtn setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark 连拍
- (IBAction)clickContinuousShootingBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    sender.layer.cornerRadius = 10;
    
    if (sender.selected) {
        
        self.cameraTimerBtn.selected = NO;
        self.norPhotographBtn.selected = NO;
        self.delayedPhotoBtn.selected = NO;
        
        [sender setBackgroundColor:RGB(17, 115, 113)];
        [self.cameraTimerBtn setBackgroundColor:[UIColor clearColor]];
        [self.norPhotographBtn setBackgroundColor:[UIColor clearColor]];
        [self.delayedPhotoBtn setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark 延时拍照
- (IBAction)clickDelayedPhotoBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    sender.layer.cornerRadius = 10;
    
    if (sender.selected) {
        
        self.cameraTimerBtn.selected = NO;
        self.norPhotographBtn.selected = NO;
        self.continuousShootingBtn.selected = NO;
        
        [sender setBackgroundColor:RGB(17, 115, 113)];
        [self.cameraTimerBtn setBackgroundColor:[UIColor clearColor]];
        [self.norPhotographBtn setBackgroundColor:[UIColor clearColor]];
        [self.continuousShootingBtn setBackgroundColor:[UIColor clearColor]];
    }
    
}


@end
