//
//  HistroyViewController.h
//  AppPhotoEdit
//
//  Created by Bo-Rong on 2018/2/23.
//  Copyright © 2018年 Bo-Rong. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseViewController.h"

#import "UserDefaultManager.h"

typedef NS_ENUM(NSInteger, HistroyNavigationBarButtonTag) {
    
    HistroyNavigationBarButtonTag_Left = 1100,
    HistroyNavigationBarButtonTag_Right,
    
};


@interface HistroyViewController : BaseViewController

/**
 * @brief Navigation 左邊按鈕
 */
@property (weak, nonatomic) IBOutlet UIBarButtonItem *navigationLeftBtn;

/**
 * @brief Navigation 右邊按鈕
 */
@property (weak, nonatomic) IBOutlet UIBarButtonItem *navigationRightBtn;

/**
 * @brief 滑動視窗
 */
@property (nonatomic, strong) UIScrollView *scrollView;

@end
