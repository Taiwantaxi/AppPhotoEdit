//
//  PhotoColumnView.m
//  AppPhotoEdit
//
//  Created by Bo-Rong on 2018/2/21.
//  Copyright © 2018年 Bo-Rong. All rights reserved.
//

#import "PhotoColumnView.h"

@implementation PhotoColumnView

#pragma mark - Inherit init function

-(void)initData{
    
}

-(void)initUI{
        
    [self.labelTitle setBackgroundColor:[UIColor yellowColor]];
    [self.labelTitle.layer setCornerRadius:5.0f];
    [self.labelTitle.layer setMasksToBounds:YES];
    [self.labelTitle.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.labelTitle.layer setBorderWidth:1.0f];
    
}

@end
