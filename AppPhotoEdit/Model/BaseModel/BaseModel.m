//
//  BaseModel.m
//  AppPhotoEdit
//
//  Created by Bo-Rong on 2018/2/22.
//  Copyright © 2018年 Bo-Rong. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

-(instancetype)init{
    
    self = [super init];
    
    if(self){
        
        [self initData];
        
    }
    
    return self;
}

#pragma mark - Inherit init function

-(void)initData{
    
}

@end
