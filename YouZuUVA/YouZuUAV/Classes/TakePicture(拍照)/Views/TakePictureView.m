//
//  TakePictureView.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/3/1.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "TakePictureView.h"
#import "SetUpView.h"
#import "HomeViewController.h"
#import "VideoSettingView.h"
#import "AirplaneModeView.h"
#import "VideoModeView.h"

@interface TakePictureView ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnWieth1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnWieth2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnWieth3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnWieth4;

@property (weak, nonatomic) IBOutlet UIButton *takePictBtn;
@property (weak, nonatomic) IBOutlet UIButton *flyHeight;
@property (weak, nonatomic) IBOutlet UIButton *flyHeight2;
@property (weak, nonatomic) IBOutlet UIButton *electricity;

@property (weak, nonatomic) IBOutlet UIButton *flyPatternBtn;
@property (weak, nonatomic) IBOutlet UIButton *recordModeBtn;

@property(nonatomic, strong) AirplaneModeView *airplaneView;
@property(nonatomic, strong) VideoModeView *videoModeView;

@property (weak, nonatomic) IBOutlet UIView *topNavView;
@property (weak, nonatomic) IBOutlet UIButton *xianJi;
@property (weak, nonatomic) IBOutlet UIButton *vidoBtn;

@property (weak, nonatomic) IBOutlet UIButton *yuYinBtn;

@property (weak, nonatomic) IBOutlet UIView *kaiGuanView;

@property (nonatomic, strong) UIView *kaiGuan2;

@property (nonatomic, strong) UIView *hiddenView;

@property (nonatomic, assign) NSInteger index;
@end

@implementation TakePictureView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"TakePictureView" owner:self options:nil] lastObject];

        [self setUpUi];
        
        UITapGestureRecognizer *clickView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenView)];
        
        
        self.index = 1;
        
        [self.topNavView addGestureRecognizer:clickView];
        
        self.kaiGuanView.layer.cornerRadius = 11;
        
        UITapGestureRecognizer *ges= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(kaiguan)];
        
        [self.kaiGuanView addGestureRecognizer:ges];
        
        UIView *kaiguan2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 26, self.kaiGuanView.height)];
        
        
        kaiguan2.layer.cornerRadius = 12;
        
        kaiguan2.backgroundColor = RGB(92, 206, 253);
        
        [self.kaiGuanView addSubview:kaiguan2];
        
        self.kaiGuan2 = kaiguan2;
        
        
    }
    return self;
}
-(void) kaiguan{
    
    if (self.index == 1) {
        
        [UIView animateWithDuration:0.1 animations:^{
            self.kaiGuan2.x = 40;
            self.kaiGuan2.backgroundColor = [UIColor cyanColor];
        }];
        self.index = 2;
        
    }else if(self.index == 2){
        
        [UIView animateWithDuration:0.1 animations:^{
            self.kaiGuan2.x = 0;
            self.kaiGuan2.backgroundColor = RGB(92, 206, 253);
        }];
        self.index = 1;
    }
}

-(void) hidenView{
    
    self.topNavView.hidden = YES;
    self.flyPatternBtn.hidden = YES;
    self.recordModeBtn.hidden = YES;
    self.xianJi.hidden = YES;
    self.vidoBtn.hidden = YES;
    self.yuYinBtn.hidden = YES;
    
    _hiddenView = [[UIView alloc] init];
    _hiddenView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    
    [self addSubview:_hiddenView];
    
    _hiddenView.layer.cornerRadius = 5;
    
    [_hiddenView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.mas_right).offset(-15);
        make.width.equalTo(@135);
        make.height.equalTo(@44);
        
    }];

    
    UIButton *dianlian = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 65, 44)];
    
//    dianlian.backgroundColor = [UIColor yellowColor];
    
    [self.hiddenView addSubview:dianlian];
    
    [dianlian setImage:[UIImage imageNamed:@"nav_ele.png"] forState:UIControlStateNormal];
    [dianlian setTitle:@"  95%" forState:UIControlStateNormal];
    
    dianlian.userInteractionEnabled = NO;
    
    dianlian.titleLabel.font = [UIFont systemFontOfSize:14];
    
    NSLog(@"%@",NSStringFromCGRect(dianlian.frame));
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    _flyPatternBtn.selected = NO;
    _recordModeBtn.selected = NO;
    
    
    self.topNavView.hidden = NO;
    self.flyPatternBtn.hidden = NO;
    self.recordModeBtn.hidden = NO;
    self.xianJi.hidden = NO;
    self.vidoBtn.hidden = NO;
    self.yuYinBtn.hidden = NO;

    
    [self.hiddenView removeFromSuperview];
    
    [UIView animateWithDuration:0.1 animations:^{
       
        _airplaneView.x = kScreenWidth;
        _videoModeView.x = kScreenWidth;
        
    }];
    
}

#pragma mark 返回主页
- (IBAction)clickHomeButton:(id)sender {

    [[NSNotificationCenter defaultCenter] postNotificationName:kclickBack object:@"back"];
    
}

#pragma mark 设置
- (IBAction)clickSetUpButton:(id)sender {
    
    self.hidden = YES;
    
    SetUpView *setUpView = [[SetUpView alloc] init];
    
    [self.window addSubview:setUpView];

    [setUpView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.right.bottom.equalTo(self);
        
    }];
}

#pragma mark 飞行模式
- (IBAction)clickAirplaneMode:(UIButton *)sender {
    
    sender.selected = YES;
    
    if (sender.selected) {
        
        self.recordModeBtn.selected = NO;
        
        [UIView animateWithDuration:0.1 animations:^{
           
            self.airplaneView.x = _flyPatternBtn.x - _airplaneView.width;
            _videoModeView.x = kScreenWidth;
        }];
        
    }
    
}

#pragma mark 录像模式
- (IBAction)clickVideoMode:(UIButton *)sender {
    
    sender.selected = YES;
    
    if (sender.selected) {
        
        [UIView animateWithDuration:0.1 animations:^{
            
            self.flyPatternBtn.selected = NO;
            
            self.videoModeView.x = _recordModeBtn.x - _videoModeView.width;
            _airplaneView.x = kScreenWidth;
        }];
        
    }
    
}

-(void) setUpUi{
    
    NSString *currentDevicec = [[NSUserDefaults standardUserDefaults] objectForKey:CurrentDevicec];
    
    if ([currentDevicec isEqualToString:@"iPhone 4"]) {
        
        AirplaneModeView *airplanView = [[AirplaneModeView alloc] init];
        
        [self addSubview:airplanView];
        
        self.airplaneView = airplanView;
        
        [airplanView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.mas_right);
            make.centerY.equalTo(self.flyPatternBtn.mas_centerY);
            make.width.equalTo(@100);
            make.height.equalTo(@130);
            
        }];
        
        
        VideoModeView *vidoModeView = [[VideoModeView alloc] init];
        
        
        [self addSubview:vidoModeView];
        
        self.videoModeView = vidoModeView;
        
        [vidoModeView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.mas_right);
            make.centerY.equalTo(self.recordModeBtn.mas_centerY);
            make.width.equalTo(@100);
            make.height.equalTo(@130);
            
        }];

        
    }else if ([currentDevicec isEqualToString:@"iPhone 5"]){
        
        AirplaneModeView *airplanView = [[AirplaneModeView alloc] init];
        
        [self addSubview:airplanView];
        
        self.airplaneView = airplanView;
        
        [airplanView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.mas_right);
            make.centerY.equalTo(self.flyPatternBtn.mas_centerY);
            make.width.equalTo(@100);
            make.height.equalTo(@130);
            
        }];
        
        
        VideoModeView *vidoModeView = [[VideoModeView alloc] init];
        
        
        [self addSubview:vidoModeView];
        
        self.videoModeView = vidoModeView;
        
        [vidoModeView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.mas_right);
            make.centerY.equalTo(self.recordModeBtn.mas_centerY);
            make.width.equalTo(@100);
            make.height.equalTo(@130);
            
        }];

        
    }else if ([currentDevicec isEqualToString:@"iPhone 6"]){
        
        AirplaneModeView *airplanView = [[AirplaneModeView alloc] init];
        
        [self addSubview:airplanView];
        
        self.airplaneView = airplanView;
        
        [airplanView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.mas_right);
            make.centerY.equalTo(self.flyPatternBtn.mas_centerY);
            make.width.equalTo(@110);
            make.height.equalTo(@160);
            
        }];
        
        
        VideoModeView *vidoModeView = [[VideoModeView alloc] init];
        
        
        [self addSubview:vidoModeView];
        
        self.videoModeView = vidoModeView;
        
        [vidoModeView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.mas_right);
            make.centerY.equalTo(self.recordModeBtn.mas_centerY);
            make.width.equalTo(@110);
            make.height.equalTo(@150);
            
        }];

        
    }else if ([currentDevicec isEqualToString:@"iPhone 6P"]){
        
        
    }else{
        
        AirplaneModeView *airplanView = [[AirplaneModeView alloc] init];
        
        [self addSubview:airplanView];
        
        self.airplaneView = airplanView;
        
        [airplanView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.mas_right);
            make.centerY.equalTo(self.flyPatternBtn.mas_centerY);
            make.width.equalTo(@110);
            make.height.equalTo(@160);
            
        }];
        
        
        VideoModeView *vidoModeView = [[VideoModeView alloc] init];
        
        
        [self addSubview:vidoModeView];
 
        self.videoModeView = vidoModeView;
        
        [vidoModeView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.mas_right);
            make.centerY.equalTo(self.recordModeBtn.mas_centerY);
            make.width.equalTo(@110);
            make.height.equalTo(@150);
            
        }];

        
    }
    
    
    
}

@end
