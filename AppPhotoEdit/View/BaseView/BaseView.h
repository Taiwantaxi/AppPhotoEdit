//
//  BaseView.h
//  AppPhotoEdit
//
//  Created by Bo-Rong on 2018/2/21.
//  Copyright © 2018年 Bo-Rong. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MHToolKit_Framwork/MHToolKit_Framwork.h>

#import "UIView+Toast.h"

#import "ProgressHUD.h"

@interface BaseView : UIView

#pragma mark - Inherit init function

-(void)initData;

-(void)initUI;

@end
