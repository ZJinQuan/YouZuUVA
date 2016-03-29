//
//  SetUpViewController.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/2/29.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "SetUpViewController.h"


@interface SetUpViewController ()
@property (weak, nonatomic) IBOutlet UINavigationBar *toolNavBar;

@end

@implementation SetUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}

//产品信息
- (IBAction)productInformationButton:(id)sender {
    
    NSLog(@"产品信息");
    
}

//更新
- (IBAction)upDataButton:(id)sender {
    
    NSLog(@"更新");
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"已经是最新版本" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [alertView show];
    
}

//帮助
- (IBAction)helpButton:(id)sender {
    
    NSLog(@"帮助");
}

//关于
- (IBAction)aboutButton:(id)sender {
    
    NSLog(@"关于");
}

//返回
- (IBAction)backItem:(id)sender {
    
    NSLog(@"返回");
    
//    [self presentViewController:HomeVC animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
