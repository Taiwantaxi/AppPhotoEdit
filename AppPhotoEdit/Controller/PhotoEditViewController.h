//
//  PhotoEditViewController.h
//  AppPhotoEdit
//
//  Created by Bo-Rong on 2018/2/21.
//  Copyright © 2018年 Bo-Rong. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseViewController.h"

#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>

#import "PreviewData.h"

typedef NS_ENUM(NSInteger, PhotoEditViewControllerTag){
    
    PhotoEditViewControllerTag_None,
    PhotoEditViewControllerTag_PhotoEdit,
    PhotoEditViewControllerTag_Size,
    PhotoEditViewControllerTag_Device,
    PhotoEditViewControllerTag_BgColor,
    PhotoEditViewControllerTag_MainTitle,
    PhotoEditViewControllerTag_SubTitle,
    PhotoEditViewControllerTag_Preview,
    PhotoEditViewControllerTag_Max,
    
};

typedef NS_ENUM(NSInteger, NavigationBarButtonTag) {
    
    NavigationBarButtonTag_Left = 1000,
    NavigationBarButtonTag_Right,
    
};

@interface PhotoEditViewController : BaseViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

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

/**
 * @brief 預覽資料
 */
@property (nonatomic, strong) PreviewData *previewData;

@end
