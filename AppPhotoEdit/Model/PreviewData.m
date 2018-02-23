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
    
    self.uiImage =  UIImagePNGRepresentation([UIImage imageNamed:@"screen"]);
    
    self.stringSize = @"4吋";
    
    self.device = @"iPhone5s";
    
    self.bgColor = @"橘色";
    
    self.mainTitle = @"App上架幫手";
    
    self.subTitle = @"簡單上架圖示編輯";
    
}

#pragma mark - public update function

-(void)updateWithDic:(NSDictionary *) dic{
    
    self.uiImage = [dic objectForKey:PreviewData_UIImage];
    
    self.stringSize = [dic objectForKey:PreviewData_StringSize];
    
    self.device = [dic objectForKey:PreviewData_Device];
    
    self.bgColor = [dic objectForKey:PreviewData_BgColor];
    
    self.mainTitle = [dic objectForKey:PreviewData_MainTitle];
    
    self.subTitle = [dic objectForKey:PreviewData_SubTitle];
    
    self.finishImage = [dic objectForKey:PreviewData_FinishImage];
    
}

@end
