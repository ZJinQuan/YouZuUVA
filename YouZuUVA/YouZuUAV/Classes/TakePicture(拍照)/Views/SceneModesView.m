//
//  SceneModesView.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/3/4.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "SceneModesView.h"

@interface SceneModesView ()

@property (weak, nonatomic) IBOutlet UIButton *automaticBtn;
@property (weak, nonatomic) IBOutlet UIButton *peopleBtn;
@property (weak, nonatomic) IBOutlet UIButton *sceneryBtn;
@property (weak, nonatomic) IBOutlet UIButton *motionBtn;

@end

@implementation SceneModesView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"SceneModesView" owner:self options:nil] lastObject];
        
        self.layer.cornerRadius = 10;
        
        [self clickAutomaticBtn:self.automaticBtn];
        
        
        NSString *currentDevicec = [[NSUserDefaults standardUserDefaults] objectForKey:CurrentDevicec];
        
        if ([currentDevicec isEqualToString:@"iPhone 4"]) {
            
            self.automaticBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            self.peopleBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            self.sceneryBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            self.motionBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            
        }else if ([currentDevicec isEqualToString:@"iPhone 5"]){
            
            
            
            
        }else if ([currentDevicec isEqualToString:@"iPhone 6"]){
            
        }else if ([currentDevicec isEqualToString:@"iPhone 6P"]){
            
            
        }else{
            
            
        }
    }
    return self;
}

#pragma mark 自动
- (IBAction)clickAutomaticBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    sender.layer.cornerRadius = 10;
    
    if (sender.selected) {
        
        self.peopleBtn.selected = NO;
        self.sceneryBtn.selected = NO;
        self.motionBtn.selected = NO;
        
        [sender setBackgroundColor:RGB(17, 115, 113)];
        [self.peopleBtn setBackgroundColor:[UIColor clearColor]];
        [self.sceneryBtn setBackgroundColor:[UIColor clearColor]];
        [self.motionBtn setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark 人物
- (IBAction)clickPeopleBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    sender.layer.cornerRadius = 10;
    
    if (sender.selected) {
        
        self.automaticBtn.selected = NO;
        self.sceneryBtn.selected = NO;
        self.motionBtn.selected = NO;
        
        [sender setBackgroundColor:RGB(17, 115, 113)];
        [self.automaticBtn setBackgroundColor:[UIColor clearColor]];
        [self.sceneryBtn setBackgroundColor:[UIColor clearColor]];
        [self.motionBtn setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark 风景
- (IBAction)clickSceneryBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    sender.layer.cornerRadius = 10;
    
    if (sender.selected) {
        
        self.peopleBtn.selected = NO;
        self.automaticBtn.selected = NO;
        self.motionBtn.selected = NO;
        
        [sender setBackgroundColor:RGB(17, 115, 113)];
        [self.peopleBtn setBackgroundColor:[UIColor clearColor]];
        [self.automaticBtn setBackgroundColor:[UIColor clearColor]];
        [self.motionBtn setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark 运动
- (IBAction)clickMotionBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    sender.layer.cornerRadius = 10;
    
    if (sender.selected) {
        
        self.peopleBtn.selected = NO;
        self.sceneryBtn.selected = NO;
        self.automaticBtn.selected = NO;
        
        [sender setBackgroundColor:RGB(17, 115, 113)];
        [self.peopleBtn setBackgroundColor:[UIColor clearColor]];
        [self.sceneryBtn setBackgroundColor:[UIColor clearColor]];
        [self.automaticBtn setBackgroundColor:[UIColor clearColor]];
    }
}
@end
