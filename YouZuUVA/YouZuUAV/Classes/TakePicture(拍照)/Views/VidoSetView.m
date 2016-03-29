//
//  VidoSetView.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/3/4.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "VidoSetView.h"

@interface VidoSetView ()

@property (weak, nonatomic) IBOutlet UIButton *normalVideo;
@property (weak, nonatomic) IBOutlet UIButton *videoCamera;
@property (weak, nonatomic) IBOutlet UIButton *delayCamera;

@property (nonatomic, strong) UISlider *slider;
@end

@implementation VidoSetView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"VidoSetView" owner:self options:nil] lastObject];
        
        self.layer.cornerRadius = 10;
        
        [self clickNormalVideo:self.normalVideo];
        
        NSString *currentDevicec = [[NSUserDefaults standardUserDefaults] objectForKey:CurrentDevicec];
        
        if ([currentDevicec isEqualToString:@"iPhone 4"]) {
            
            self.normalVideo.titleLabel.font = [UIFont systemFontOfSize:15];
            self.videoCamera.titleLabel.font = [UIFont systemFontOfSize:15];
            self.delayCamera.titleLabel.font = [UIFont systemFontOfSize:15];
            
        }else if ([currentDevicec isEqualToString:@"iPhone 5"]){
            
            
        }else if ([currentDevicec isEqualToString:@"iPhone 6"]){
            
        }else if ([currentDevicec isEqualToString:@"iPhone 6P"]){
            
            
        }else{
            
        }
        
    }
    return self;
}

#pragma mark 正常录像
- (IBAction)clickNormalVideo:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    sender.layer.cornerRadius = 10;
    
    if (sender.selected) {
        
        [sender setBackgroundColor:RGB(17, 115, 113)];
        [self.videoCamera setBackgroundColor:[UIColor clearColor]];
        [self.delayCamera setBackgroundColor:[UIColor clearColor]];
        
        self.videoCamera.selected = NO;
        self.delayCamera.selected = NO;
    }
    
}

#pragma mark 录像时拍照
- (IBAction)clickVideoCamera:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    sender.layer.cornerRadius = 10;
    
    if (sender.selected) {
        
        self.normalVideo.selected = NO;
        self.delayCamera.selected = NO;
        
        [sender setBackgroundColor:RGB(17, 115, 113)];
        [self.normalVideo setBackgroundColor:[UIColor clearColor]];
        [self.delayCamera setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark 延时拍照
- (IBAction)clickDelayCamera:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    sender.layer.cornerRadius = 10;
    
    if (sender.selected) {
        
        self.normalVideo.selected = NO;
        self.videoCamera.selected = NO;
        
        [sender setBackgroundColor:RGB(17, 115, 113)];
        [self.normalVideo setBackgroundColor:[UIColor clearColor]];
        [self.videoCamera setBackgroundColor:[UIColor clearColor]];
    }
    
}

@end
