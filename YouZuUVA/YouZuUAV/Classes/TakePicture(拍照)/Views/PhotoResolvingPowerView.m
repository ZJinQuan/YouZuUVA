//
//  PhotoResolvingPowerView.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/3/4.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "PhotoResolvingPowerView.h"

@interface PhotoResolvingPowerView ()

@property (weak, nonatomic) IBOutlet UIButton *sdBtn;
@property (weak, nonatomic) IBOutlet UIButton *hdBtn;
@property (weak, nonatomic) IBOutlet UIButton *auperClearBtn;
@property (weak, nonatomic) IBOutlet UIButton *blueLightBtn;

@end

@implementation PhotoResolvingPowerView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"PhotoResolvingPowerView" owner:self options:nil] lastObject];
        
        self.layer.cornerRadius = 10;
        
        [self clickSdBtn:self.sdBtn];
    }
    return self;
}

#pragma mark 标清
- (IBAction)clickSdBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    sender.layer.cornerRadius = 10;
    
    if (sender.selected) {
        
        self.hdBtn.selected = NO;
        self.auperClearBtn.selected = NO;
        self.blueLightBtn.selected = NO;
        
        [sender setBackgroundColor:RGB(17, 115, 113)];
        [self.hdBtn setBackgroundColor:[UIColor clearColor]];
        [self.auperClearBtn setBackgroundColor:[UIColor clearColor]];
        [self.blueLightBtn setBackgroundColor:[UIColor clearColor]];
    }
    
}

#pragma mark 高清
- (IBAction)clickHdBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    sender.layer.cornerRadius = 10;
    
    if (sender.selected) {
        
        self.sdBtn.selected = NO;
        self.auperClearBtn.selected = NO;
        self.blueLightBtn.selected = NO;
        
        [sender setBackgroundColor:RGB(17, 115, 113)];
        [self.sdBtn setBackgroundColor:[UIColor clearColor]];
        [self.auperClearBtn setBackgroundColor:[UIColor clearColor]];
        [self.blueLightBtn setBackgroundColor:[UIColor clearColor]];
    }
    
}

#pragma mark 超清
- (IBAction)clickAuperClearBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    sender.layer.cornerRadius = 10;
    
    if (sender.selected) {
        
        self.sdBtn.selected = NO;
        self.hdBtn.selected = NO;
        self.blueLightBtn.selected = NO;
        
        [sender setBackgroundColor:RGB(17, 115, 113)];
        [self.sdBtn setBackgroundColor:[UIColor clearColor]];
        [self.hdBtn setBackgroundColor:[UIColor clearColor]];
        [self.blueLightBtn setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark 蓝光
- (IBAction)clickBlueLightBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    sender.layer.cornerRadius = 10;
    
    if (sender.selected) {
        
        self.sdBtn.selected = NO;
        self.hdBtn.selected = NO;
        self.auperClearBtn.selected = NO;
        
        [sender setBackgroundColor:RGB(17, 115, 113)];
        [self.sdBtn setBackgroundColor:[UIColor clearColor]];
        [self.hdBtn setBackgroundColor:[UIColor clearColor]];
        [self.auperClearBtn setBackgroundColor:[UIColor clearColor]];
    }

}

@end
