//
//  PreviewData.h
//  AppPhotoEdit
//
//  Created by Bo-Rong on 2018/2/22.
//  Copyright © 2018年 Bo-Rong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#import "BaseModel.h"

@interface PreviewData : BaseModel

/**
 * @brief 照片
 */
@property (nonatomic, strong) UIImage *uiImage;

/**
 * @brief 尺寸
 */
@property (nonatomic, strong) NSString *stringSize;

/**
 * @brief 設備
 */
@property (nonatomic, strong) NSString *device;

/**
 * @brief 背景顏色
 */
@property (nonatomic, strong) NSString *bgColor;

/**
 * @brief 主標題
 */
@property (nonatomic, strong) NSString *mainTitle;

/**
 * @brief 副標題
 */
@property (nonatomic, strong) NSString *subTitle;



@end
