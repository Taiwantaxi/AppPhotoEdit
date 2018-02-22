//
//  InfoColumnView.h
//  AppPhotoEdit
//
//  Created by Bo-Rong on 2018/2/22.
//  Copyright © 2018年 Bo-Rong. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseView.h"

@interface InfoColumnView : BaseView

/**
 * @brief 標題
 */
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

/**
 * @brief 內容
 */
@property (weak, nonatomic) IBOutlet UILabel *labelContent;


@end
