//
//  PhotoColumnView.h
//  AppPhotoEdit
//
//  Created by Bo-Rong on 2018/2/21.
//  Copyright © 2018年 Bo-Rong. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseView.h"

@interface PhotoColumnView : BaseView

/**
 * @brief 標題
 */
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

/**
 * @brief 圖片
 */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
