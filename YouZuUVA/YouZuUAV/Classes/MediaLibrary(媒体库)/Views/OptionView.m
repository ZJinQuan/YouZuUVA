//
//  OptionView.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/2/29.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "OptionView.h"

@implementation OptionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIButton *shareBtn = [[UIButton alloc] init];
        
        [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
        [shareBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [self addSubview:shareBtn];
        
        [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left);
            make.bottom.equalTo(self.mas_bottom);
            
        }];
        
        UIButton *deleteBtn = [[UIButton alloc] init];
        
        [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        [deleteBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [self addSubview:deleteBtn];
        
        [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.mas_top);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.mas_bottom);
            make.left.equalTo(shareBtn.mas_right);
            make.width.equalTo(shareBtn.mas_width);
            
        }];
        
        
    }
    return self;
}

@end
