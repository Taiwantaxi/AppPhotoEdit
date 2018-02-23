//
//  HistroyViewController.m
//  AppPhotoEdit
//
//  Created by Bo-Rong on 2018/2/23.
//  Copyright © 2018年 Bo-Rong. All rights reserved.
//

#import "HistroyViewController.h"

#import "PhotoEditViewController.h"

@interface HistroyViewController ()
{
    NSMutableArray *arrayImageFromDB;
    
    NSInteger selectImageIndex;
}
@end

@implementation HistroyViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self updateData];
    
    [self updateUI];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Inherit init function

-(void)initData{
    
    arrayImageFromDB = [[NSMutableArray alloc] init];
    
}

-(void)initUI{
    
    //NavigationBarButton
    [self.navigationLeftBtn setTag:HistroyNavigationBarButtonTag_Left];
    [self.navigationLeftBtn setTarget:self];
    [self.navigationLeftBtn setAction:@selector(navigationActionBtn:)];
    
    [self.navigationRightBtn setTag:HistroyNavigationBarButtonTag_Right];
    [self.navigationRightBtn setTarget:self];
    [self.navigationRightBtn setAction:@selector(navigationActionBtn:)];
    
    //UIScrollView
    CGSize sizeScrollView = CGSizeMake(kWinSizeWidth, kWinSizeHeight - 64.0f - 49.0f);
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 64.0f, sizeScrollView.width, sizeScrollView.height)];
    [self.scrollView setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.view addSubview:self.scrollView];
    [self.scrollView setContentSize:CGSizeMake(sizeScrollView.width, sizeScrollView.height)];
    
}

#pragma mark - private data function

-(void)updateData{
    
    NSArray *arrayResult = nil;
    if([[UserDefaultManager sharedInstance] getPhotoImageArray]){
        arrayResult = [[UserDefaultManager sharedInstance] getPhotoImageArray];
    }
    
    if(arrayImageFromDB.count > 0){
        [arrayImageFromDB removeAllObjects];
    }
    
    [arrayImageFromDB addObjectsFromArray:arrayResult];
    
}

-(void)deleteSelectImage{
    
    NSLog(@"%s", __FUNCTION__);
    
    [arrayImageFromDB removeObjectAtIndex:selectImageIndex];
    [[UserDefaultManager sharedInstance] savePhotoImageArray:arrayImageFromDB];
    
    [self updateData];
    
    [self updateUI];
    
}

#pragma mark - private ui function

-(void)updateUI{
    
    [self removeAllSubview];
    
    NSInteger maxImageCount = arrayImageFromDB.count;
    
    if(maxImageCount % 2 == 0){
        
        NSInteger col = 2;
        NSInteger row = maxImageCount / 2;
        CGPoint cellOffset = CGPointMake(0.0f, rHeight(20.0f));
        CGPoint cellGap = CGPointMake(10.0f, rHeight(10.0f));
        CGSize cellSize = CGSizeMake((kWinSizeWidth - cellGap.x)/ 2.0f, rHeight(160.0f));
        
        
        [MHArrangeUtil arrangeTileWithCol:col withRow:row withSize:cellSize withOffset:cellOffset withGap:cellGap withOzArrangeBlock:^(CGRect rect, NSInteger index) {
            
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            dic = [arrayImageFromDB objectAtIndex:index];
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
            [imageView setTag:index];
            [imageView setImage:[UIImage imageWithData:[dic objectForKey:PreviewData_FinishImage]]];
            [imageView setContentMode:UIViewContentModeScaleAspectFit];
            [imageView setUserInteractionEnabled:YES];
            UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
            [imageView addGestureRecognizer:recognizer];
            
            [self.scrollView addSubview:imageView];
            
            [self.scrollView setContentSize:CGSizeMake(kWinSizeWidth, imageView.frame.origin.y + imageView.frame.size.height + rHeight(10))];
            
        }];
        
        
    }else if (maxImageCount % 2 == 1){
        
        NSInteger col = 2;
        NSInteger row = maxImageCount / 2 + 1;
        CGPoint cellOffset = CGPointMake(0.0f, rHeight(20.0f));
        CGPoint cellGap = CGPointMake(10.0f, rHeight(10.0f));
        CGSize cellSize = CGSizeMake((kWinSizeWidth - cellGap.x)/ 2.0f, rHeight(160.0f));
        
        
        [MHArrangeUtil arrangeTileWithCol:col withRow:row withSize:cellSize withOffset:cellOffset withGap:cellGap withOzArrangeBlock:^(CGRect rect, NSInteger index) {
            
            if(index < maxImageCount){
                
                NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
                dic = [arrayImageFromDB objectAtIndex:index];
                
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
                [imageView setTag:index];
                [imageView setImage:[UIImage imageWithData:[dic objectForKey:PreviewData_FinishImage]]];
                [imageView setContentMode:UIViewContentModeScaleAspectFit];
                [imageView setUserInteractionEnabled:YES];
                UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
                [imageView addGestureRecognizer:recognizer];
                
                [self.scrollView addSubview:imageView];
                
                [self.scrollView setContentSize:CGSizeMake(kWinSizeWidth, imageView.frame.origin.y + imageView.frame.size.height + rHeight(10))];

                
            }
            
        }];

        
        
    }
    
    
}

-(void)removeAllSubview{
    
    for(UIView *m_view in self.scrollView.subviews){
        [m_view removeFromSuperview];
    }
    
}

#pragma mark - private action function

-(void)viewTap:(UIGestureRecognizer *) recognizer{
  
    selectImageIndex = recognizer.view.tag;
    
    for(UIImageView *tempImageview in self.scrollView.subviews){
        
        if(tempImageview.tag == selectImageIndex){
            
            [tempImageview setBackgroundColor:[UIColor grayColor]];
            
        }else{
            
            [tempImageview setBackgroundColor:[UIColor clearColor]];
            
        }
        
    }
    
}

-(void)navigationActionBtn:(id) sender{
    
    UIBarButtonItem *targetBtn = (UIBarButtonItem *) sender;
    
    if(targetBtn.tag == HistroyNavigationBarButtonTag_Left){
        
        [self deleteSelectImage];
        
    }else if (targetBtn.tag == HistroyNavigationBarButtonTag_Right){
        
        UINavigationController *nav = [self.tabBarController.viewControllers objectAtIndex:0];
        PhotoEditViewController *targetVc = [nav.viewControllers objectAtIndex:0];
        PreviewData *previewData = [[PreviewData alloc] init];
        [previewData updateWithDic:[arrayImageFromDB objectAtIndex:selectImageIndex]];
        targetVc.previewData = previewData;
        [self.tabBarController setSelectedIndex:0];


    }
    
}



@end
