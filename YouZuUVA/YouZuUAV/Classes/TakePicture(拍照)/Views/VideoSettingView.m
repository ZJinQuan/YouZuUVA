//
//  VideoSettingView.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/3/3.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "VideoSettingView.h"
#import "VidoSetView.h"
#import "ResolvingPowerView.h"

@interface VideoSettingView ()

@property (weak, nonatomic) IBOutlet UIView *backView;

@property (weak, nonatomic) IBOutlet UIView *seledView;
@property (weak, nonatomic) IBOutlet UIView *seledView2;

@property (weak, nonatomic) IBOutlet UIButton *videoSettingBtn;
@property (weak, nonatomic) IBOutlet UIButton *resolvingPowerBtn;

@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (nonatomic, strong) UIView *vidoSet;
@property (nonatomic, strong) UIView *resolvingP;
@end

@implementation VideoSettingView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"VideoSettingView" owner:self options:nil] lastObject];
        
        self.backView.layer.cornerRadius = 5;
        
        [self VidoSettingBtn:self.videoSettingBtn];
        
        [_slider setThumbImage:[UIImage imageNamed:@"tab_link_nor"] forState:UIControlStateNormal];
        
        _slider.minimumValue = 1;
        _slider.maximumValue = 5;
        _slider.minimumTrackTintColor = [UIColor clearColor];
        _slider.maximumTrackTintColor = [UIColor clearColor];
        
        [_slider addTarget:self
                    action:@selector(valueChanged:)
          forControlEvents:UIControlEventValueChanged];
        
        UITapGestureRecognizer *tap =
        [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        
        
        [_slider addGestureRecognizer:tap];
        
        [self setUpUi];
    }
    return self;
}

- (void)valueChanged:(UISlider *)sender
{
    //只取整数值，固定间距
    NSString *tempStr = [self numberFormat:sender.value];
    [sender setValue:tempStr.floatValue];
}

- (void)tapAction:(UITapGestureRecognizer *)sender
{
    //取得点击点
    CGPoint p = [sender locationInView:_slider];
    //计算处于背景图的几分之几，并将之转换为滑块的值（1~7）
    float tempFloat = (p.x - 15) / 295.0 * 7 + 1;
    NSString *tempStr = [self numberFormat:tempFloat];
    //    NSLog(@"%f,%f,%@", p.x, tempFloat, tempStr);
    [_slider setValue:tempStr.floatValue];
}


- (NSString *)numberFormat:(float)num
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setPositiveFormat:@"0"];
    return [formatter stringFromNumber:[NSNumber numberWithFloat:num]];
}

#pragma mark 录像模式
- (IBAction)VidoSettingBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    
    if (sender.selected) {
        
        self.vidoSet.hidden = NO;
        self.resolvingP.hidden = YES;
        
        
        self.resolvingPowerBtn.selected = NO;
        
        self.seledView.hidden = NO;
        self.seledView2.hidden = YES;
    }
    
}

#pragma mark 分辨率
- (IBAction)resolvingPowerBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    if (sender.selected) {
        
        self.vidoSet.hidden = YES;
        self.resolvingP.hidden = NO;
        
        self.videoSettingBtn.selected = NO;
        
        self.seledView.hidden = YES;
        self.seledView2.hidden = NO;
        
    }
    
}

#pragma mark 设置UI
-(void) setUpUi{
    
    NSString *currentDevicec = [[NSUserDefaults standardUserDefaults] objectForKey:CurrentDevicec];
    
    
    if ([currentDevicec isEqualToString:@"iPhone 4"]) {
        
        VidoSetView *vidoSet = [[VidoSetView alloc] init];
        
        [self addSubview:vidoSet];
        self.vidoSet = vidoSet;
        
        [vidoSet mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width).offset(30);
            make.height.equalTo(@140);
            
        }];
        
        ResolvingPowerView *resolvingP = [[ResolvingPowerView alloc] init];
        
        resolvingP.hidden = YES;
        [self addSubview:resolvingP];
        self.resolvingP = resolvingP;
        
        [resolvingP mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width).offset(50);
            make.height.equalTo(@140);
            
        }];
        
    }else if ([currentDevicec isEqualToString:@"iPhone 5"]){
        
        VidoSetView *vidoSet = [[VidoSetView alloc] init];
        
        [self addSubview:vidoSet];
        self.vidoSet = vidoSet;
        
        [vidoSet mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width);
            make.height.equalTo(@140);
            
        }];
        
        ResolvingPowerView *resolvingP = [[ResolvingPowerView alloc] init];
        
        resolvingP.hidden = YES;
        [self addSubview:resolvingP];
        self.resolvingP = resolvingP;
        
        [resolvingP mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width).offset(20);
            make.height.equalTo(@140);
            
        }];
        
        
    }else if ([currentDevicec isEqualToString:@"iPhone 6"]){
        
        VidoSetView *vidoSet = [[VidoSetView alloc] init];
        
        [self addSubview:vidoSet];
        self.vidoSet = vidoSet;
        
        [vidoSet mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width).offset(-60);
            make.height.equalTo(@140);
            
        }];
        
        ResolvingPowerView *resolvingP = [[ResolvingPowerView alloc] init];
        
        resolvingP.hidden = YES;
        [self addSubview:resolvingP];
        self.resolvingP = resolvingP;
        
        [resolvingP mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width);
            make.height.equalTo(@140);
            
        }];
        
    }else if ([currentDevicec isEqualToString:@"iPhone 6P"]){
        
        
    }else{
        
        VidoSetView *vidoSet = [[VidoSetView alloc] init];
        
        [self addSubview:vidoSet];
        self.vidoSet = vidoSet;
        
        [vidoSet mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width).offset(-60);
            make.height.equalTo(@140);
            
        }];
        
        ResolvingPowerView *resolvingP = [[ResolvingPowerView alloc] init];
        
        resolvingP.hidden = YES;
        [self addSubview:resolvingP];
        self.resolvingP = resolvingP;
        
        [resolvingP mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width);
            make.height.equalTo(@140);
            
        }];
        
    }
    
    
}

@end
