//
//  MoreViewController.m
//  AppPhotoEdit
//
//  Created by Bo-Rong on 2018/2/23.
//  Copyright © 2018年 Bo-Rong. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Inherit init function

-(void)initData{
    
}

-(void)initUI{
        
    CGSize sizeLabelVersion = CGSizeMake(kWinSizeWidth, rHeight(50.0f));
    UILabel *labelVersion = [[UILabel alloc] initWithFrame:CGRectMake((kWinSizeWidth - sizeLabelVersion.width) / 2.0f, kWinSizeHeight - sizeLabelVersion.height - 49.0f - rHeight(20.0f), sizeLabelVersion.width, sizeLabelVersion.height)];
    [labelVersion setText:[NSString stringWithFormat:@"v%@", [kMHDeviceManager getAppVersion]]];
    [labelVersion setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:labelVersion];
    
}

@end
