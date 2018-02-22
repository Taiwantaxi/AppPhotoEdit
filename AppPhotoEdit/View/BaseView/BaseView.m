//
//  BaseView.m
//  AppPhotoEdit
//
//  Created by Bo-Rong on 2018/2/21.
//  Copyright © 2018年 Bo-Rong. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

//自訂 view with code 畫面初始化
-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
        [self initData];
        
        [self initUI];
        
    }
    
    return self;
    
}

//載入 nib 畫面初始化
-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self initData];
    
    [self initUI];
    
}

#pragma mark - Inherit init function

-(void)initData{
    
}

-(void)initUI{
    
}

@end
