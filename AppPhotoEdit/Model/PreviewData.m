//
//  PreviewData.m
//  AppPhotoEdit
//
//  Created by Bo-Rong on 2018/2/22.
//  Copyright © 2018年 Bo-Rong. All rights reserved.
//

#import "PreviewData.h"

@implementation PreviewData

#pragma mark - Inherit init function

-(void)initData{
    
    self.uiImage = [UIImage imageNamed:@"screen"];
    
    self.stringSize = @"4吋";
    
    self.device = @"iPhone5s";
    
    self.bgColor = @"橘色";
    
    self.mainTitle = @"App上架幫手";
    
    self.subTitle = @"簡單上架圖示編輯";
    
}


@end
