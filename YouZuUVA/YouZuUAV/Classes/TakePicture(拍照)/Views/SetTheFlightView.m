//
//  SetTheFlightView.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/3/3.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "SetTheFlightView.h"
#import "EFCircularSlider.h"

@interface SetTheFlightView ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineLength1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineLength1s;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineLength2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineLength2s;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineLength3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineLength3s;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineLength4;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineLength4s;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *followPosition;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *takeOffPosition;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *surroundPosition;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *selfDisPosition;


@property (weak, nonatomic) IBOutlet UIView *followDistanceView;
@property (weak, nonatomic) IBOutlet UIView *takeOffHeightView;
@property (weak, nonatomic) IBOutlet UIView *surroundDistanceView;
@property (weak, nonatomic) IBOutlet UIView *selfDistanceView;

@property (weak, nonatomic) IBOutlet UILabel *followDistanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *takeOffHeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *surroundDistanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *selfDistanceLabel;


@property (nonatomic, strong) EFCircularSlider *sliderView;
@end

@implementation SetTheFlightView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"SetTheFlightView" owner:self options:nil] lastObject];
        
        [self setUpUi];
    }
    return self;
}

#pragma mark 设置UI
-(void) setUpUi{
    
    
    NSString *currentDevicec = [[NSUserDefaults standardUserDefaults] objectForKey:CurrentDevicec];
    
    NSLog(@"%@",currentDevicec);
    
    if ([currentDevicec isEqualToString:@"iPhone 4"]) {
        
        self.lineLength1.constant = 120;
        self.lineLength1s.constant = 120;
        self.lineLength2.constant = 120;
        self.lineLength2s.constant = 120;
        self.lineLength3.constant = 120;
        self.lineLength3s.constant = 120;
        self.lineLength4.constant = 120;
        self.lineLength4s.constant = 120;
        
        self.followPosition.constant = -180;
        self.takeOffPosition.constant = -60;
        self.surroundPosition.constant = 60;
        self.selfDisPosition.constant = 180;
        
    }else if ([currentDevicec isEqualToString:@"iPhone 5"]){
        
        
        
        
    }else if ([currentDevicec isEqualToString:@"iPhone 6"]){
        
        self.followPosition.constant = -250;
        self.takeOffPosition.constant = -80;
        self.surroundPosition.constant = 80;
        self.selfDisPosition.constant = 250;
        
    }else if ([currentDevicec isEqualToString:@"iPhone 6P"]){
        
        self.followPosition.constant = -260;
        self.takeOffPosition.constant = -90;
        self.surroundPosition.constant = 90;
        self.selfDisPosition.constant = 260;
        
    }else{
        
        self.followPosition.constant = -250;
        self.takeOffPosition.constant = -80;
        self.surroundPosition.constant = 80;
        self.selfDisPosition.constant = 250;
        
    }
    
    
    int lineWidth = 15;
    
    EFCircularSlider* followDistanceSld = [[EFCircularSlider alloc] initWithFrame:CGRectMake(0, 0, self.followDistanceView.height, self.followDistanceView.height)];
    
    followDistanceSld.lineWidth = lineWidth;
    followDistanceSld.filledColor = RGB(49, 254, 240);
    followDistanceSld.unfilledColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    followDistanceSld.currentValue = 20;
    
    [followDistanceSld addTarget:self action:@selector(followDistance:) forControlEvents:UIControlEventValueChanged];
    [self.followDistanceView addSubview:followDistanceSld];
    
    
    EFCircularSlider* takeOffHeightSld = [[EFCircularSlider alloc] initWithFrame:CGRectMake(0, 0, self.takeOffHeightView.height, self.takeOffHeightView.height)];
    
    takeOffHeightSld.lineWidth = lineWidth;
    takeOffHeightSld.filledColor = RGB(49, 254, 240);
    takeOffHeightSld.unfilledColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    [takeOffHeightSld addTarget:self action:@selector(takeOffHeight:) forControlEvents:UIControlEventValueChanged];
    [self.takeOffHeightView addSubview:takeOffHeightSld];
    
    EFCircularSlider* surroundDistanceSld = [[EFCircularSlider alloc] initWithFrame:CGRectMake(0, 0, self.surroundDistanceView.height, self.surroundDistanceView.height)];
    
    surroundDistanceSld.lineWidth = lineWidth;
    surroundDistanceSld.filledColor = RGB(49, 254, 240);
    surroundDistanceSld.unfilledColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    [surroundDistanceSld addTarget:self action:@selector(surroundDistance:) forControlEvents:UIControlEventValueChanged];
    [self.surroundDistanceView addSubview:surroundDistanceSld];
    
    EFCircularSlider* selfDistanceSld = [[EFCircularSlider alloc] initWithFrame:CGRectMake(0, 0, self.selfDistanceView.height, self.selfDistanceView.height)];
    
    selfDistanceSld.lineWidth = lineWidth;
    selfDistanceSld.filledColor = RGB(49, 254, 240);
    selfDistanceSld.unfilledColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    [selfDistanceSld addTarget:self action:@selector(selfDistanceSld:) forControlEvents:UIControlEventValueChanged];
    
    [self.selfDistanceView addSubview:selfDistanceSld];

    
}

-(void)followDistance:(EFCircularSlider*)slider {
    
    self.followDistanceLabel.text = [NSString stringWithFormat:@"%.fm",slider.currentValue];
}
-(void)takeOffHeight:(EFCircularSlider*)slider {
    
    self.takeOffHeightLabel.text = [NSString stringWithFormat:@"%.fm",slider.currentValue];
}
-(void)surroundDistance:(EFCircularSlider*)slider {
    
    self.surroundDistanceLabel.text = [NSString stringWithFormat:@"%.fm",slider.currentValue];
}
-(void)selfDistanceSld:(EFCircularSlider*)slider {
    
    self.selfDistanceLabel.text = [NSString stringWithFormat:@"%.fm",slider.currentValue];
}

@end
