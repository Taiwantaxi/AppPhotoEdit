//
//  UserDefaultManager.h
//  AppPhotoEdit
//
//  Created by Bo-Rong on 2018/2/23.
//  Copyright © 2018年 Bo-Rong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

//照片資訊
#define kUserDefaultKey_PhotoImage                         @"kUserDefaultKey_PhotoImage"

@interface UserDefaultManager : NSObject


#pragma mark - public function

+ (UserDefaultManager *)sharedInstance;

- (void)savePhotoImageArray:(NSArray *) array;

- (NSArray *)getPhotoImageArray;


@end
