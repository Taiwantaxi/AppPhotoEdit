//
//  PhotoEditViewController.m
//  AppPhotoEdit
//
//  Created by Bo-Rong on 2018/2/21.
//  Copyright © 2018年 Bo-Rong. All rights reserved.
//

#import "PhotoEditViewController.h"

#import "PhotoColumnView.h"

#import "InfoColumnView.h"

#import "PreColumnView.h"

@interface PhotoEditViewController ()

@end

@implementation PhotoEditViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
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
    
    self.previewData = [[PreviewData alloc] init];
    
}

-(void)initUI{
    
    //NavigationBarButton
    [self.navigationLeftBtn setTag:NavigationBarButtonTag_Left];
    [self.navigationLeftBtn setTarget:self];
    [self.navigationLeftBtn setAction:@selector(navigationActionBtn:)];
    
    [self.navigationRightBtn setTag:NavigationBarButtonTag_Right];
    [self.navigationRightBtn setTarget:self];
    [self.navigationRightBtn setAction:@selector(navigationActionBtn:)];
    
    //UIScrollView
    CGSize sizeScrollView = CGSizeMake(kWinSizeWidth, kWinSizeHeight - 64.0f - 49.0f);
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 64.0f, sizeScrollView.width, sizeScrollView.height)];
    [self.scrollView setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.view addSubview:self.scrollView];

    //照片
    CGSize sizePhotoEditView = CGSizeMake(kWinSizeWidth, rHeight(120.0f));
    PhotoColumnView *photoEditView = [[[NSBundle mainBundle] loadNibNamed:@"PhotoColumnView" owner:self options:nil] firstObject];
    [photoEditView setTag:PhotoEditViewControllerTag_PhotoEdit];
    [photoEditView setFrame:CGRectMake(0.0f, 0.0f, sizePhotoEditView.width, sizePhotoEditView.height)];
    [photoEditView.labelTitle setText:@"圖片"];
    UITapGestureRecognizer *photoEditViewRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
    [photoEditView addGestureRecognizer:photoEditViewRecognizer];
    [self.scrollView addSubview:photoEditView];
    
    //尺寸
    CGSize sizeView = CGSizeMake(kWinSizeWidth, rHeight(50.0f));
    InfoColumnView *sizeInfoView = [[[NSBundle mainBundle] loadNibNamed:@"InfoColumnView" owner:self options:nil] firstObject];
    [sizeInfoView setTag:PhotoEditViewControllerTag_Size];
    [sizeInfoView setFrame:CGRectMake(0.0f, photoEditView.frame.origin.y + photoEditView.frame.size.height, sizeView.width, sizeView.height)];
    [sizeInfoView.labelTitle setText:@"尺寸"];
    UITapGestureRecognizer *sizeInfoViewRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
    [sizeInfoView addGestureRecognizer:sizeInfoViewRecognizer];
    [self.scrollView addSubview:sizeInfoView];
    
    //設備
    CGSize sizeDeviceView = CGSizeMake(kWinSizeWidth, rHeight(50.0f));
    InfoColumnView *deviceInfoView = [[[NSBundle mainBundle] loadNibNamed:@"InfoColumnView" owner:self options:nil] firstObject];
    [deviceInfoView setTag:PhotoEditViewControllerTag_Device];
    [deviceInfoView setFrame:CGRectMake(0.0f, sizeInfoView.frame.origin.y + sizeInfoView.frame.size.height, sizeDeviceView.width, sizeDeviceView.height)];
    [deviceInfoView.labelTitle setText:@"設備"];
    UITapGestureRecognizer *deviceInfoViewRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
    [deviceInfoView addGestureRecognizer:deviceInfoViewRecognizer];
    [self.scrollView addSubview:deviceInfoView];
    
    
    //背景顏色
    CGSize sizeBgColorView = CGSizeMake(kWinSizeWidth, rHeight(50.0f));
    InfoColumnView *bgColorInfoView = [[[NSBundle mainBundle] loadNibNamed:@"InfoColumnView" owner:self options:nil] firstObject];
    [bgColorInfoView setTag:PhotoEditViewControllerTag_BgColor];
    [bgColorInfoView setFrame:CGRectMake(0.0f, deviceInfoView.frame.origin.y + deviceInfoView.frame.size.height, sizeBgColorView.width, sizeBgColorView.height)];
    [bgColorInfoView.labelTitle setText:@"顏色"];
    UITapGestureRecognizer *bgColorInfoViewRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
    [bgColorInfoView addGestureRecognizer:bgColorInfoViewRecognizer];
    [self.scrollView addSubview:bgColorInfoView];
    
    //主標題
    CGSize sizeMainTitleView = CGSizeMake(kWinSizeWidth, rHeight(50.0f));
    InfoColumnView *mainTitleInfoView = [[[NSBundle mainBundle] loadNibNamed:@"InfoColumnView" owner:self options:nil] firstObject];
    [mainTitleInfoView setTag:PhotoEditViewControllerTag_MainTitle];
    [mainTitleInfoView setFrame:CGRectMake(0.0f, bgColorInfoView.frame.origin.y + bgColorInfoView.frame.size.height, sizeMainTitleView.width, sizeMainTitleView.height)];
    [mainTitleInfoView.labelTitle setText:@"主標"];
    UITapGestureRecognizer *mainTitleInfoViewRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
    [mainTitleInfoView addGestureRecognizer:mainTitleInfoViewRecognizer];
    [self.scrollView addSubview:mainTitleInfoView];

    //副標題
    CGSize sizeSubTitleView = CGSizeMake(kWinSizeWidth, rHeight(50.0f));
    InfoColumnView *subTitleInfoView = [[[NSBundle mainBundle] loadNibNamed:@"InfoColumnView" owner:self options:nil] firstObject];
    [subTitleInfoView setTag:PhotoEditViewControllerTag_SubTitle];
    [subTitleInfoView setFrame:CGRectMake(0.0f, mainTitleInfoView.frame.origin.y + mainTitleInfoView.frame.size.height, sizeSubTitleView.width, sizeSubTitleView.height)];
    [subTitleInfoView.labelTitle setText:@"副標"];
    UITapGestureRecognizer *subTitleInfoViewRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
    [subTitleInfoView addGestureRecognizer:subTitleInfoViewRecognizer];
    [self.scrollView addSubview:subTitleInfoView];

    //預覽
    CGSize sizePreview = CGSizeMake(kWinSizeWidth, rHeight(480));
    PreColumnView *preView = [[[NSBundle mainBundle] loadNibNamed:@"PreColumnView" owner:self options:nil] firstObject];
    [preView setTag:PhotoEditViewControllerTag_Preview];
    [preView setFrame:CGRectMake(0.0f, subTitleInfoView.frame.origin.y + sizeSubTitleView.height, sizePreview.width, sizePreview.height)];
    [self.scrollView addSubview:preView];
    
    //UIScrollView 內容大小
    [self.scrollView setContentSize:CGSizeMake(kWinSizeWidth, preView.frame.origin.y + preView.frame.size.height + rHeight(5.0f))];
}

#pragma mark - private action function

-(void)viewTap:(UIGestureRecognizer *) recognizer{
    
    if(recognizer.view.tag == PhotoEditViewControllerTag_PhotoEdit){
        
        //[self.view makeToast:@"PhotoEditView" duration:3.0f position:CSToastPositionCenter];
        
        [self presentCameraPickerVc];
        
    }else if (recognizer.view.tag == PhotoEditViewControllerTag_Size){
        
        //[self.view makeToast:@"SizeInfoView" duration:3.0f position:CSToastPositionCenter];
        
        
    }else if (recognizer.view.tag == PhotoEditViewControllerTag_Device){
        
        //[self.view makeToast:@"DeviceInfoView" duration:3.0f position:CSToastPositionCenter];
        
    }else if (recognizer.view.tag == PhotoEditViewControllerTag_BgColor){
        
        //[self.view makeToast:@"BgColorInfoView" duration:3.0f position:CSToastPositionCenter];
        
    }else if (recognizer.view.tag == PhotoEditViewControllerTag_MainTitle){
        
        //[self.view makeToast:@"MainTitleInfoView" duration:3.0f position:CSToastPositionCenter];
        
    }else if (recognizer.view.tag == PhotoEditViewControllerTag_SubTitle){
        
        //[self.view makeToast:@"SubTitleInfoView" duration:3.0f position:CSToastPositionCenter];
        
    }
    
}


-(void)navigationActionBtn:(id) sender{
 
    UIBarButtonItem *targetBtn = (UIBarButtonItem *) sender;
    
    if(targetBtn.tag == NavigationBarButtonTag_Left){
        
        [self savePreviewDataToLocalDB];
        
    }else if (targetBtn.tag == NavigationBarButtonTag_Right){
        
        [self showShareUI];
        
    }
    
}

#pragma mark - private data function

- (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

-(void)savePreviewDataToLocalDB{
    
    NSLog(@"%s", __FUNCTION__);
    
    PreColumnView *preView = [self.scrollView viewWithTag:PhotoEditViewControllerTag_Preview];
    UIImage *tempImage = [self imageWithView:preView.preView];
    tempImage = [self imageWithImage:tempImage scaledToSize:CGSizeMake(320, 568)];
    self.previewData.finishImage = UIImagePNGRepresentation(tempImage);
    
    NSArray *arrayImageFromDB = nil;
    if([[UserDefaultManager sharedInstance] getPhotoImageArray]){
        arrayImageFromDB = [[UserDefaultManager sharedInstance] getPhotoImageArray];
    }
    
    NSMutableArray *arrayResult = [[NSMutableArray alloc] initWithArray:arrayImageFromDB];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:self.previewData.uiImage forKey:PreviewData_UIImage];
    [dic setObject:self.previewData.stringSize forKey:PreviewData_StringSize];
    [dic setObject:self.previewData.device forKey:PreviewData_Device];
    [dic setObject:self.previewData.bgColor forKey:PreviewData_BgColor];
    [dic setObject:self.previewData.mainTitle forKey:PreviewData_MainTitle];
    [dic setObject:self.previewData.subTitle forKey:PreviewData_SubTitle];
    [dic setObject:self.previewData.finishImage forKey:PreviewData_FinishImage];
    [arrayResult addObject:dic];

    [[UserDefaultManager sharedInstance] savePhotoImageArray:arrayResult];
    
    [self.view makeToast:@"已儲存到歷史紀錄" duration:3.0f position:CSToastPositionCenter];
    
    
}


#pragma mark - private ui function

-(void)updateUI {
    
    for(NSInteger i = PhotoEditViewControllerTag_None; i < PhotoEditViewControllerTag_Max; i++){
        
        if(i == PhotoEditViewControllerTag_PhotoEdit){
            
            PhotoColumnView *photoEditView = [self.scrollView viewWithTag:i];
            
            [photoEditView.imageView setImage:[UIImage imageWithData:self.previewData.uiImage]];
            
        }else if (i == PhotoEditViewControllerTag_Size){
            
            InfoColumnView *sizeInfoView = [self.scrollView viewWithTag:i];
            
            [sizeInfoView.labelContent setText:self.previewData.stringSize];
            
        }else if (i == PhotoEditViewControllerTag_Device){
            
            InfoColumnView *deviceInfoView = [self.scrollView viewWithTag:i];

            [deviceInfoView.labelContent setText:self.previewData.device];
            
        }else if (i == PhotoEditViewControllerTag_BgColor){
            
            InfoColumnView *bgColorInfoView = [self.scrollView viewWithTag:i];

            [bgColorInfoView.labelContent setText:self.previewData.bgColor];
            
        }else if (i == PhotoEditViewControllerTag_MainTitle){
            
            InfoColumnView *mainTitleInfoView = [self.scrollView viewWithTag:i];

            [mainTitleInfoView.labelContent setText:self.previewData.mainTitle];
            
        }else if (i == PhotoEditViewControllerTag_SubTitle){
            
            InfoColumnView *subTitleInfoView = [self.scrollView viewWithTag:i];
            
            [subTitleInfoView.labelContent setText:self.previewData.subTitle];
            
        }else if (i == PhotoEditViewControllerTag_Preview){
            
            PreColumnView *preView = [self.scrollView viewWithTag:i];
            
            [preView.imageView setImage:[UIImage imageWithData:self.previewData.uiImage]];
            
        }
        
    }
    
}

-(void)presentCameraPickerVc{
    
    NSLog(@"%s", __FUNCTION__);
    
    //相簿權限
    ALAuthorizationStatus statusPhoto = [ALAssetsLibrary authorizationStatus];

    if(statusPhoto == ALAuthorizationStatusAuthorized || statusPhoto == ALAuthorizationStatusNotDetermined){
        
        [self showAlbum];
        
    }else{
        
        [self showAlbumAuthFail];
        
    }
    
}

-(void)showAlbum{
    
    NSLog(@"%s", __FUNCTION__);
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.allowsEditing = NO;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

-(void)showAlbumAuthFail{
    
    NSLog(@"%s", __FUNCTION__);
    
    [ProgressHUD showError:@"無法開啟，相簿尚未授權"];
    
}

-(void)showShareUI{
    
    NSLog(@"%s", __FUNCTION__);
    
    PreColumnView *preView = [self.scrollView viewWithTag:PhotoEditViewControllerTag_Preview];
    UIImage *tempImage = [self imageWithView:preView.preView];
    tempImage = [self imageWithImage:tempImage scaledToSize:CGSizeMake(320, 568)];
    
    UIActivityViewController *avc = [[UIActivityViewController alloc] initWithActivityItems:[NSArray arrayWithObjects:@"App上架圖", UIImagePNGRepresentation(tempImage), nil] applicationActivities:nil];
    [self presentViewController:avc animated:YES completion:nil];
    
}

#pragma mark - UIImagePickerControllerDelegate


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    NSLog(@"%s", __FUNCTION__);
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if(!image){
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
        self.previewData.uiImage = UIImagePNGRepresentation(image);
        
        [self updateUI];
        
    }];
    
}


#pragma mark - UINavigationControllerDelegate

@end
