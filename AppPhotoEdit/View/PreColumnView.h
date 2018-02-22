//
//  PreColumnView.h
//  AppPhotoEdit
//
//  Created by Bo-Rong on 2018/2/22.
//  Copyright © 2018年 Bo-Rong. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseView.h"

@interface PreColumnView : BaseView

/**
 * @brief 主標題
 */
@property (weak, nonatomic) IBOutlet UILabel *labelMainTitle;

/**
 * @brief 副標題
 */
@property (weak, nonatomic) IBOutlet UILabel *labelSubTitle;

/**
 * @brief 圖片
 */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
