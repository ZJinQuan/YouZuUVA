//
//  TakePictureController.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/3/1.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "TakePictureController.h"
#import "SetUpView.h"
#import "TakePictureView.h"
#import "HomeViewController.h"


@interface TakePictureController ()

@property (nonatomic, strong) TakePictureView *takePictView;

@end

@implementation TakePictureController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickBack:) name:kclickBack object:nil];
    
    
    NSLog(@"%@",NSStringFromCGRect([UIScreen mainScreen].bounds));
    
    TakePictureView *takePictView = [[TakePictureView alloc] init];
    
    self.takePictView = takePictView;
    
    [self.view addSubview:takePictView];
    
    [takePictView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view);
        
    }];
    
}

-(void)clickBack:(NSNotification *)noti{
    
    self.takePictView.hidden = NO;
    
    if (noti.object != 0) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    
}




@end
