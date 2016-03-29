//
//  StatementViewController.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/2/29.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "StatementViewController.h"
#import "HomeViewController.h"

@interface StatementViewController ()

- (IBAction)clickAgreeButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *agreeButton;

@property (weak, nonatomic) IBOutlet UIButton *enter;
@end

@implementation StatementViewController

- (void)viewDidLoad { 
    [super viewDidLoad];
    
    _enter.layer.borderWidth = 1;
    _enter.layer.borderColor = [UIColor whiteColor].CGColor;
    _enter.layer.cornerRadius = 5;
    
}

//进入游族
- (IBAction)enter:(UIButton *)sender {
    
    if (_agreeButton.selected) {
        HomeViewController *homeView = [[HomeViewController alloc] init];
        
        [self presentViewController:homeView animated:YES completion:nil];
        
        NSLog(@"进入游族");
    }
    
}

- (IBAction)clickAgreeButton:(UIButton *)sender {
    sender.selected = !sender.selected;
}
@end
