//
//  UserDefaultManager.m
//  AppPhotoEdit
//
//  Created by Bo-Rong on 2018/2/23.
//  Copyright © 2018年 Bo-Rong. All rights reserved.
//

#import "UserDefaultManager.h"

static UserDefaultManager *instance = nil;
@implementation UserDefaultManager

-(instancetype)init{
    
    self = [super init];
    if(self){
        
        [self initData];
        
    }
    return self;
    
}




#pragma mark - private init function

-(void)initData{
    
    
}

#pragma mark - public method

+(UserDefaultManager *)sharedInstance{
    
    @synchronized ([UserDefaultManager class]) {
        if(!instance){
            instance = [[self alloc] init];
        }
        return instance;
    }
    return nil;
    
}

-(void)savePhotoImageArray:(NSArray *) array{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: array forKey:kUserDefaultKey_PhotoImage];
    [defaults synchronize];
    
}

-(NSArray *)getPhotoImageArray{
    
    NSArray *arrayResult = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultKey_PhotoImage];
    return arrayResult;
    
}

@end
