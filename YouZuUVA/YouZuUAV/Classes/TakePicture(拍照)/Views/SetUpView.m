//
//  SetUpView.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/3/1.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "SetUpView.h"
#import "TakePictureView.h"
#import "VideoSettingView.h"
#import "CameraSettingView.h"
#import "SetTheFlightView.h"
#import "CalibrationSettingView.h"

@interface SetUpView ()
@property (weak, nonatomic) IBOutlet UIView *seledView1;
@property (weak, nonatomic) IBOutlet UIView *seledView2;
@property (weak, nonatomic) IBOutlet UIView *seledView3;
@property (weak, nonatomic) IBOutlet UIView *seledView4;


@property (weak, nonatomic) IBOutlet UIView *topNavView;
@property (weak, nonatomic) IBOutlet UIButton *videoSettingsBtn;
@property (weak, nonatomic) IBOutlet UIButton *cameraSettingsBtn;
@property (weak, nonatomic) IBOutlet UIButton *setTheFlightBtn;
@property (weak, nonatomic) IBOutlet UIButton *calibrationSettingsBtn;

@property (nonatomic, strong) UIView *settingView;
@property (nonatomic, strong) UIView *cameraSettingView;
@property (nonatomic, strong) UIView *setTheFlightView;
@property (nonatomic, strong) UIView *calibrationSettingsView;

@property (nonatomic, strong) UISlider *leftSlider;
@property (nonatomic, strong) UISlider *rightSlider;

@end

@implementation SetUpView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"SetUpView" owner:self options:nil] lastObject];
        
        self.seledView1.layer.cornerRadius = 2.5;
        self.seledView2.layer.cornerRadius = 2.5;
        self.seledView3.layer.cornerRadius = 2.5;
        self.seledView4.layer.cornerRadius = 2.5;
        
        
        [self initTheSlider];
        
        [self setUpUi];
        
        //默认选中第一个
        [self videoSettings:self.videoSettingsBtn];
        
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"SetUpView" owner:self options:nil] lastObject];
        
        self.seledView1.layer.cornerRadius = 2.5;
        self.seledView2.layer.cornerRadius = 2.5;
        self.seledView3.layer.cornerRadius = 2.5;
        self.seledView4.layer.cornerRadius = 2.5;
        
        
        [self initTheSlider];
        
        [self setUpUi];
        
        //默认选中第一个
        [self videoSettings:self.videoSettingsBtn];
    }
    return self;
}

#pragma mark 录像设置
- (IBAction)videoSettings:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    self.settingView.hidden = NO;
    
    
    if (sender.selected) {
        
        self.cameraSettingsBtn.selected = NO;
        self.setTheFlightBtn.selected = NO;
        self.calibrationSettingsBtn.selected = NO;
        
        self.cameraSettingView.hidden = YES;
        self.setTheFlightView.hidden = YES;
        self.calibrationSettingsView.hidden = YES;
        
        self.leftSlider.hidden = NO;
        self.rightSlider.hidden = NO;
        
        self.seledView1.hidden = NO;
        self.seledView2.hidden = YES;
        self.seledView3.hidden = YES;
        self.seledView4.hidden = YES;
    }
    
}

#pragma mark 拍照设置
- (IBAction)cameraSettings:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    self.cameraSettingView.hidden = NO;
    
    
    if (sender.selected) {
        
        self.settingView.hidden = YES;
        self.setTheFlightView.hidden = YES;
        self.calibrationSettingsView.hidden = YES;
        
        self.videoSettingsBtn.selected = NO;
        self.setTheFlightBtn.selected = NO;
        self.calibrationSettingsBtn.selected = NO;
        
        self.leftSlider.hidden = NO;
        self.rightSlider.hidden = NO;
        
        self.seledView1.hidden = YES;
        self.seledView2.hidden = NO;
        self.seledView3.hidden = YES;
        self.seledView4.hidden = YES;
    }
    
}

#pragma mark 飞行设置
- (IBAction)setTheFlight:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    self.setTheFlightView.hidden = NO;
    
    
    if (sender.selected) {
        
        self.settingView.hidden = YES;
        self.cameraSettingView.hidden = YES;
        self.calibrationSettingsView.hidden = YES;
        
        self.videoSettingsBtn.selected = NO;
        self.cameraSettingsBtn.selected = NO;
        self.calibrationSettingsBtn.selected = NO;
        
        self.leftSlider.hidden = YES;
        self.rightSlider.hidden = YES;
        
        self.seledView1.hidden = YES;
        self.seledView2.hidden = YES;
        self.seledView3.hidden = NO;
        self.seledView4.hidden = YES;
    }
}

#pragma mark 校准设置
- (IBAction)calibrationSettings:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    self.calibrationSettingsView.hidden = NO;
    
    if (sender.selected) {
        
        self.videoSettingsBtn.selected = NO;
        self.setTheFlightBtn.selected = NO;
        self.cameraSettingsBtn.selected = NO;
        
        self.settingView.hidden = YES;
        self.cameraSettingView.hidden = YES;
        self.setTheFlightView.hidden = YES;
        
        self.leftSlider.hidden = YES;
        self.rightSlider.hidden = YES;
        
        self.seledView1.hidden = YES;
        self.seledView2.hidden = YES;
        self.seledView3.hidden = YES;
        self.seledView4.hidden = NO;
    }
}

#pragma mark 返回
- (IBAction)clickBackbutton:(id)sender {
    
    
    NSLog(@"返回");
    
    self.hidden = YES;
    
//    NSNotification *not = [NSNotification notificationWithName:kclickBack object:nil];
    
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:kclickBack object:nil]];
    
}

#pragma mark 左右滑竿
-(void) initTheSlider{
    
    
    NSString *currentDevicec = [[NSUserDefaults standardUserDefaults] objectForKey:CurrentDevicec];
    
    NSLog(@"%@",currentDevicec);
    
    if ([currentDevicec isEqualToString:@"iPhone 4"]) {
        
        UISlider *leftSlider = [[UISlider alloc]initWithFrame:CGRectMake(-70, kScreenHeight / 2, kScreenHeight - 2 * 50, 30)];
        
        [self makeSlider:leftSlider andMinValue:0 andMaxValue:1];
        
        [leftSlider addTarget:self action:@selector(leftSliderClick:) forControlEvents:UIControlEventValueChanged];
        leftSlider.value = 0.3;
        
        [self addSubview:leftSlider];
        self.leftSlider = leftSlider;
        
        UISlider *rightSlider = [[UISlider alloc] initWithFrame:CGRectMake(330, kScreenHeight / 2, kScreenHeight - 2 * 50, 30)];
        
        [self makeSlider:rightSlider andMinValue:0 andMaxValue:20];
        
        rightSlider.value = 13;
        
        [rightSlider addTarget:self action:@selector(rightSliderClick:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:rightSlider];
        self.rightSlider = rightSlider;
        
        
    }else if ([currentDevicec isEqualToString:@"iPhone 5"]){
        
        UISlider *leftSlider = [[UISlider alloc]initWithFrame:CGRectMake(-70, kScreenHeight / 2, kScreenHeight - 2 * 50, 30)];
        
        [self makeSlider:leftSlider andMinValue:0 andMaxValue:1];
        
        [leftSlider addTarget:self action:@selector(leftSliderClick:) forControlEvents:UIControlEventValueChanged];
        leftSlider.value = 0.3;
        
        [self addSubview:leftSlider];
        self.leftSlider = leftSlider;
        
        UISlider *rightSlider = [[UISlider alloc] initWithFrame:CGRectMake(420, kScreenHeight / 2, kScreenHeight - 2 * 50, 30)];
        
        [self makeSlider:rightSlider andMinValue:0 andMaxValue:20];
        
        rightSlider.value = 13;
        
        [rightSlider addTarget:self action:@selector(rightSliderClick:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:rightSlider];
        self.rightSlider = rightSlider;
        
        
    }else if ([currentDevicec isEqualToString:@"iPhone 6"]){
        
        UISlider *leftSlider = [[UISlider alloc]initWithFrame:CGRectMake(-70, kScreenHeight / 2, kScreenHeight - 2 * 50, 30)];
        
        [self makeSlider:leftSlider andMinValue:0 andMaxValue:1];
        
        [leftSlider addTarget:self action:@selector(leftSliderClick:) forControlEvents:UIControlEventValueChanged];
        leftSlider.value = 0.3;
        
        [self addSubview:leftSlider];
        self.leftSlider = leftSlider;
        
        UISlider *rightSlider = [[UISlider alloc] initWithFrame:CGRectMake(475, kScreenHeight / 2, kScreenHeight - 2 * 50, 30)];
        
        [self makeSlider:rightSlider andMinValue:0 andMaxValue:20];
        
        rightSlider.value = 13;
        
        [rightSlider addTarget:self action:@selector(rightSliderClick:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:rightSlider];
        self.rightSlider = rightSlider;
        
    }else if ([currentDevicec isEqualToString:@"iPhone 6P"]){
        
        UISlider *leftSlider = [[UISlider alloc]initWithFrame:CGRectMake(-90, kScreenHeight / 2, kScreenHeight - 2 * 50, 30)];
        
        [self makeSlider:leftSlider andMinValue:0 andMaxValue:1];
        
        [leftSlider addTarget:self action:@selector(leftSliderClick:) forControlEvents:UIControlEventValueChanged];
        leftSlider.value = 0.3;
        
        [self addSubview:leftSlider];
        self.leftSlider = leftSlider;
        
        UISlider *rightSlider = [[UISlider alloc] initWithFrame:CGRectMake(510, kScreenHeight / 2, kScreenHeight - 2 * 50, 30)];
        
        [self makeSlider:rightSlider andMinValue:0 andMaxValue:20];
        
        rightSlider.value = 13;
        
        [rightSlider addTarget:self action:@selector(rightSliderClick:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:rightSlider];
        self.rightSlider = rightSlider;
        
        
    }else{
        
        UISlider *leftSlider = [[UISlider alloc]initWithFrame:CGRectMake(-70, kScreenHeight / 2, kScreenHeight - 2 * 50, 30)];
        
        [self makeSlider:leftSlider andMinValue:0 andMaxValue:1];
        
        [leftSlider addTarget:self action:@selector(leftSliderClick:) forControlEvents:UIControlEventValueChanged];
        leftSlider.value = 0.3;
        
        [self addSubview:leftSlider];
        self.leftSlider = leftSlider;
        
        UISlider *rightSlider = [[UISlider alloc] initWithFrame:CGRectMake(475, kScreenHeight / 2, kScreenHeight - 2 * 50, 30)];
        
        [self makeSlider:rightSlider andMinValue:0 andMaxValue:20];
        
        rightSlider.value = 13;
        
        [rightSlider addTarget:self action:@selector(rightSliderClick:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:rightSlider];
        self.rightSlider = rightSlider;
        
    }
    
    
}

#pragma mark 初始化UI
-(void) setUpUi{
    
    VideoSettingView *settingView = [[VideoSettingView alloc] init];
    settingView.hidden = YES;
    
    [self addSubview:settingView];
    
    self.settingView = settingView;
    
    [settingView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.topNavView.mas_bottom);
        make.left.equalTo(self.mas_left).offset(120);
        make.right.equalTo(self.mas_right).offset(-120);
        make.bottom.equalTo(self.mas_bottom);
        
    }];
    
    CameraSettingView *cameraSettingView = [[CameraSettingView alloc] init];
    cameraSettingView.hidden = YES;
    
    [self addSubview:cameraSettingView];

    self.cameraSettingView = cameraSettingView;
    
    [cameraSettingView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.topNavView.mas_bottom);
        make.left.equalTo(self.mas_left).offset(120);
        make.right.equalTo(self.mas_right).offset(-120);
        make.bottom.equalTo(self.mas_bottom);
        
    }];
    
    SetTheFlightView *setTheFlightView = [[SetTheFlightView alloc] init];
    
    setTheFlightView.hidden = YES;
    
    [self addSubview:setTheFlightView];
    
    self.setTheFlightView = setTheFlightView;
    
    [setTheFlightView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self.topNavView.mas_bottom);
        
    }];
    
    CalibrationSettingView *calibrationSettingsView = [[CalibrationSettingView alloc] init];
    
    calibrationSettingsView.hidden = YES;
    
    [self addSubview:calibrationSettingsView];
    
    self.calibrationSettingsView = calibrationSettingsView;
    
    [calibrationSettingsView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self.topNavView.mas_bottom);
        
    }];
    
    
}

- (void)leftSliderClick:(UISlider *)leftSlider
{
    // 默认vale值0——1
    NSLog(@"%f", leftSlider.value);
}

- (void)rightSliderClick:(UISlider *)leftSlider
{
    // 默认vale值0——1
    NSLog(@"%f", leftSlider.value);
}

//左右滑竿
-(void) makeSlider:(UISlider *) slider andMinValue: (float) min andMaxValue: (float) max{
    
    slider.minimumValue = min;
    slider.maximumValue = max;
    
    UIImage* trackImg = [UIImage imageNamed: @"left_sel.png"];
    UIImage* trackNor = [UIImage imageNamed: @"left_nor.png"];
    
    [slider setMinimumTrackImage: trackImg forState: UIControlStateNormal];
    [slider setMaximumTrackImage: trackNor forState: UIControlStateNormal];
    
    slider.transform = CGAffineTransformMakeRotation(- M_PI_2);
    
    slider.continuous = YES;
    
    [slider setThumbImage:[UIImage imageNamed:@"left_slider.png"] forState:UIControlStateNormal];
    
    [slider setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    
    slider.layer.cornerRadius = 15;
}


@end
