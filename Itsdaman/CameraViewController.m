//
//  CameraViewController.m
//  Itsdaman
//
//  Created by Yash Varma on 2/3/14.
//  Copyright (c) 2014 Yash Varma. All rights reserved.
//

#import "CameraViewController.h"
#import "Parse/Parse.h"
#import "MBProgressHUD.h"
#include <stdlib.h>

@interface CameraViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, MBProgressHUDDelegate>
{
    PFImageView * imageView;
    MBProgressHUD *refreshHUD;
    MBProgressHUD * newHud;
    
    NSData * imageDatas;
}
@end

@implementation CameraViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

}




@end
