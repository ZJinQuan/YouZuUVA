//
//  CameraSettingView.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/3/3.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "CameraSettingView.h"
#import "TakePictPatternView.h"
#import "SceneModesView.h"
#import "PhotoResolvingPowerView.h"

@interface CameraSettingView ()
@property (weak, nonatomic) IBOutlet UIView *backView;

@property (weak, nonatomic) IBOutlet UIView *seledView1;
@property (weak, nonatomic) IBOutlet UIView *seledView2;
@property (weak, nonatomic) IBOutlet UIView *seledView3;
@property (weak, nonatomic) IBOutlet UIButton *takePictureBtn;
@property (weak, nonatomic) IBOutlet UIButton *sceneBtn;
@property (weak, nonatomic) IBOutlet UIButton *resolvingPowerBtn;

@property (nonatomic, strong) UIView *takePictPattern;
@property (nonatomic, strong) UIView *sceneModesView;
@property (nonatomic, strong) UIView *photoResolPowerView;
@end

@implementation CameraSettingView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"CameraSettingView" owner:self options:nil] lastObject];
    
        self.backView.layer.cornerRadius = 5;
        
        [self clickTakePictureBtn:self.takePictureBtn];
        
        [self setUpUi];
        
    }
    return self;
}

#pragma mark 拍照模式
- (IBAction)clickTakePictureBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    if (sender.selected) {
        
        self.takePictPattern.hidden = NO;
        self.sceneModesView.hidden = YES;
        self.photoResolPowerView.hidden = YES;
        
        self.seledView1.hidden = NO;
        self.seledView2.hidden = YES;
        self.seledView3.hidden = YES;
        
        self.sceneBtn.selected = NO;
        self.resolvingPowerBtn.selected = NO;
    }
    
}

#pragma mark 场景模式
- (IBAction)clickSceneBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    if (sender.selected) {
        
        self.takePictPattern.hidden = YES;
        self.sceneModesView.hidden = NO;
        self.photoResolPowerView.hidden = YES;

        self.seledView1.hidden = YES;
        self.seledView2.hidden = NO;
        self.seledView3.hidden = YES;
        
        self.takePictureBtn.selected = NO;
        self.resolvingPowerBtn.selected = NO;
        
    }
}

#pragma mark 分辨率
- (IBAction)clickResolvingPowerBtn:(UIButton *)sender {
    
    NSLog(@"%@",sender.currentTitle);
    
    sender.selected = YES;
    
    if (sender.selected) {
        
        self.sceneModesView.hidden = YES;
        self.takePictPattern.hidden = YES;
        self.photoResolPowerView.hidden = NO;
        
        self.seledView1.hidden = YES;
        self.seledView2.hidden = YES;
        self.seledView3.hidden = NO;
        
        self.sceneBtn.selected = NO;
        self.takePictureBtn.selected = NO;
    }
}

#pragma mark 设置UI
-(void) setUpUi{
    
    
    
    NSString *currentDevicec = [[NSUserDefaults standardUserDefaults] objectForKey:CurrentDevicec];
    
    NSLog(@"%@",currentDevicec);
    
    if ([currentDevicec isEqualToString:@"iPhone 4"]) {
        
        TakePictPatternView *takePictPattern = [[TakePictPatternView alloc] init];
        
        [self addSubview:takePictPattern];
        self.takePictPattern = takePictPattern;
        [takePictPattern mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width).offset(50);
            make.height.equalTo(@140);
            
        }];
        
        SceneModesView *sceneModesView = [[SceneModesView alloc] init];
        sceneModesView.hidden = YES;
        [self addSubview:sceneModesView];
        self.sceneModesView = sceneModesView;
        [sceneModesView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width).offset(50);
            make.height.equalTo(@140);
            
        }];
        
        PhotoResolvingPowerView *photoResolPowerView = [[PhotoResolvingPowerView alloc] init];
        photoResolPowerView.hidden = YES;
        [self addSubview:photoResolPowerView];
        self.photoResolPowerView = photoResolPowerView;
        [photoResolPowerView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width).offset(50);
            make.height.equalTo(@140);
            
        }];
        
        
    }else if ([currentDevicec isEqualToString:@"iPhone 5"]){
        

        TakePictPatternView *takePictPattern = [[TakePictPatternView alloc] init];
        
        [self addSubview:takePictPattern];
        self.takePictPattern = takePictPattern;
        [takePictPattern mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width).offset(20);
            make.height.equalTo(@140);
            
        }];
        
        SceneModesView *sceneModesView = [[SceneModesView alloc] init];
        sceneModesView.hidden = YES;
        [self addSubview:sceneModesView];
        self.sceneModesView = sceneModesView;
        [sceneModesView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width).offset(20);
            make.height.equalTo(@140);
            
        }];
        
        PhotoResolvingPowerView *photoResolPowerView = [[PhotoResolvingPowerView alloc] init];
        photoResolPowerView.hidden = YES;
        [self addSubview:photoResolPowerView];
        self.photoResolPowerView = photoResolPowerView;
        [photoResolPowerView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width).offset(20);
            make.height.equalTo(@140);
            
        }];

        
    }else if ([currentDevicec isEqualToString:@"iPhone 6"]){
        
        TakePictPatternView *takePictPattern = [[TakePictPatternView alloc] init];
        
        [self addSubview:takePictPattern];
        self.takePictPattern = takePictPattern;
        [takePictPattern mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width);
            make.height.equalTo(@140);
            
        }];
        
        SceneModesView *sceneModesView = [[SceneModesView alloc] init];
        sceneModesView.hidden = YES;
        [self addSubview:sceneModesView];
        self.sceneModesView = sceneModesView;
        [sceneModesView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width);
            make.height.equalTo(@140);
            
        }];
        
        PhotoResolvingPowerView *photoResolPowerView = [[PhotoResolvingPowerView alloc] init];
        photoResolPowerView.hidden = YES;
        [self addSubview:photoResolPowerView];
        self.photoResolPowerView = photoResolPowerView;
        [photoResolPowerView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width);
            make.height.equalTo(@140);
            
        }];

       
    }else if ([currentDevicec isEqualToString:@"iPhone 6P"]){
        
        
    }else{
        
        TakePictPatternView *takePictPattern = [[TakePictPatternView alloc] init];
        
        [self addSubview:takePictPattern];
        self.takePictPattern = takePictPattern;
        [takePictPattern mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width);
            make.height.equalTo(@140);
            
        }];
        
        SceneModesView *sceneModesView = [[SceneModesView alloc] init];
        sceneModesView.hidden = YES;
        [self addSubview:sceneModesView];
        self.sceneModesView = sceneModesView;
        [sceneModesView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width);
            make.height.equalTo(@140);
            
        }];
        
        PhotoResolvingPowerView *photoResolPowerView = [[PhotoResolvingPowerView alloc] init];
        photoResolPowerView.hidden = YES;
        [self addSubview:photoResolPowerView];
        self.photoResolPowerView = photoResolPowerView;
        [photoResolPowerView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self);
            make.width.equalTo(self.mas_width);
            make.height.equalTo(@140);
            
        }];
        
        
    }

}
@end
