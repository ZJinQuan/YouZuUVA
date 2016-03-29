//
//  MediaLibraryController.m
//  FamilyTravelUAV
//
//  Created by QUAN on 16/2/29.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "MediaLibraryController.h"
#import "OptionView.h"
#import "ImageOrVideoCell.h"
#import "ESLocalModel.h"
#import "AppDelegate.h"

@interface MediaLibraryController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *optionItem;

@property (weak, nonatomic) IBOutlet UICollectionView *localPhotoAlbumView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segView;
@end

@implementation MediaLibraryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.segView.layer.borderWidth = 1;
    self.segView.layer.borderColor = RGB(70, 216, 207).CGColor;
    self.segView.layer.cornerRadius = 15;
    self.segView.layer.masksToBounds = YES;
    self.segView.tintColor = RGB(70, 216, 207);
    [self setUpUI];
}

-(void) setUpUI{
    
    
    _localPhotoAlbumView.backgroundColor = self.view.backgroundColor;
//    _localPhotoAlbumView.dataSource = self;
//    _localPhotoAlbumView.delegate = self;
//    _localPhotoAlbumView.contentInset = UIEdgeInsetsMake(66, 0, 51, 0);
    
    
    UICollectionViewFlowLayout *localGridFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    localGridFlowLayout.minimumLineSpacing = 0;//上下行与行之间的间距
    localGridFlowLayout.minimumInteritemSpacing = 0;//同一行 item与item之间的间距

    localGridFlowLayout.itemSize = CGSizeMake(150, 150);
    
    
}

- (IBAction)backItem:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)optionItem:(id)sender {
    
    NSLog(@"选项");
    
    OptionView *option = [[OptionView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 49, kScreenWidth, 49)];
    
    option.backgroundColor = [UIColor colorWithRed:251.0 green:251.0 blue:251.0 alpha:1.0];
    
    option.backgroundColor = RGB(251, 251, 251);
    
    [self.view addSubview:option];
}

#pragma mark UICollectionViewDataSource  UICollectionViewDelegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (collectionView == _localPhotoAlbumView) {
        return 1;
    } else {
        return 0;
    }
    
}

//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
////        
////        UICollectionViewCell *localCell =[collectionView dequeueReusableCellWithReuseIdentifier:@"ImageOrVideoGridCellLocal" forIndexPath:indexPath];
//    
//        
////        ESLocalModel *model = [AppDelegate shareAppDelegate].localPictureModelArrays[indexPath.item];
//    
////        localCell.iconImageView.image = [UIImage imageNamed:@"right_fli_model.png"];
//    
////        localCell.localPictureMode = model;
//    
////    localCell.backgroundColor = [UIColor purpleColor];
//    
//    
//        return localCell;
//    
//}

@end





