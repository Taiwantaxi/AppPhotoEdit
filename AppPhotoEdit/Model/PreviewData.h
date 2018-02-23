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
@property (nonatomic, strong) NSData *uiImage;

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

/**
 * @brief 編輯好的畫面
 */
@property (nonatomic, strong) NSData *finishImage;

#pragma mark - public update function

-(void)updateWithDic:(NSDictionary *) dic;


#define PreviewData_UIImage                     @"perviewdata_uiImage"

#define PreviewData_StringSize                  @"perviewdata_stringSize"

#define PreviewData_Device                      @"perviewdata_device"

#define PreviewData_BgColor                     @"perviewdata_bgColor"

#define PreviewData_MainTitle                   @"perviewdata_mainTitle"

#define PreviewData_SubTitle                    @"perviewdata_subTitle"

#define PreviewData_FinishImage                 @"perviewdata_finishImage"

@end
