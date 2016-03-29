//
//  HomeViewController.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/2/29.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "HomeViewController.h"
#import "SetUpViewController.h"
#import "MediaLibraryController.h"
#import "ProductController.h"
#import "TakePictureController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLine;

//未连接Label
@property (weak, nonatomic) IBOutlet UILabel *connected;
@property (weak, nonatomic) IBOutlet UIButton *connectBtn;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _connectBtn.layer.borderWidth = 1;
    _connectBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    _connectBtn.layer.cornerRadius = 5;
    
    NSString *currentDevicec = [[NSUserDefaults standardUserDefaults] objectForKey:CurrentDevicec];
    
    NSLog(@"%@",currentDevicec);
    
    if ([currentDevicec isEqualToString:@"iPhone 4"]) {
        
        self.heightLine.constant = 20;
        
    }else if ([currentDevicec isEqualToString:@"iPhone 5"]){

        self.heightLine.constant = 20;
        
        
    }else if ([currentDevicec isEqualToString:@"iPhone 6"]){
        
    }else if ([currentDevicec isEqualToString:@"iPhone 6P"]){
        
        self.heightLine.constant = 80;
        
    }else{
        
        
    }
}

//立即连接
- (IBAction)connectButton:(UIButton *)sender {
    
    if (!_connectBtn.selected) {

        self.connected.text = @"游族FEDR_320";
        
        _connectBtn.selected = YES;
        
        [self.connectBtn addTarget:self action:@selector(beginTakePicture) forControlEvents:UIControlEventTouchDown];
        
    }else{
        
        
        
    }
    
}

-(void)beginTakePicture{
    
    TakePictureController *takepictureVC = [[TakePictureController alloc] init];
    
    [self presentViewController:takepictureVC animated:YES completion:nil];
    
    
}

//游族产品
- (IBAction)product:(id)sender {
    NSLog(@"游族产品");
    
    ProductController *productVC = [[ProductController alloc] init];
    
    [self presentViewController:productVC animated:YES completion:nil];
    
}

//媒体库
- (IBAction)mediaLibrary:(id)sender {
    NSLog(@"媒体库");
    
    MediaLibraryController *mediaVC = [[MediaLibraryController alloc] init];
    
    [self presentViewController:mediaVC animated:YES completion:nil];
}

//设置
- (IBAction)setUp:(id)sender {
    NSLog(@"设置");
    
    SetUpViewController *setUpController = [[SetUpViewController alloc] init];
    
    [self presentViewController:setUpController animated:YES completion:nil];
    
}


@end
