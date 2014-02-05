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

@interface CameraViewController () <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, MBProgressHUDDelegate>
{

    MBProgressHUD *refreshHUD;
    MBProgressHUD * HUD;
    
    __weak IBOutlet UIImageView *myImageView;
    NSData * imageOfData;
}
@end

@implementation CameraViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    

}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self choosePhotoFromExistingImages];
            break;
            
        default:
            break;
    }
}

- (IBAction)browseButton:(id)sender
{
    UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                              delegate:self
                                                     cancelButtonTitle:@"Cancel"
                                                destructiveButtonTitle:nil
                                                     otherButtonTitles:@"Choose From Existing", nil];
    
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];

}

- (IBAction)uploadButton:(id)sender
{
    
    [self uploadImage:imageOfData];
}


#pragma mark MBProgressHUDDelegate

-(void)hudWasHidden:(MBProgressHUD *)hud
{
    [HUD removeFromSuperview];
    HUD = nil;
}

- (void)uploadImage:(NSData *)imageData;
{
    PFFile *imageFile = [PFFile fileWithName:@"image.jpg" data:imageData];
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    
    [self.view addSubview:HUD];
    
    HUD.mode = MBProgressHUDModeDeterminate;
    HUD.delegate = self;
    HUD.labelText = @"Uploading";
    [HUD show:YES];
    
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(!error) {
            [HUD hide:YES];
            
            HUD = [[MBProgressHUD alloc] initWithView:self.view];
            [self.view addSubview:HUD];
            
            HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
            
            HUD.mode = MBProgressHUDModeCustomView;
            HUD.delegate = self;
            
            PFObject *userPhoto = [PFObject objectWithClassName:@"Photo"];
            [userPhoto setObject:imageFile forKey:@"imageFile"];
            userPhoto.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
            
            PFUser *user = [PFUser currentUser];
            [userPhoto setObject:user forKey:@"user"];
            
            
            [userPhoto saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                    [self refreshImage:nil];
                } else {
                    NSLog(@"Error %@ %@",error, [error userInfo]);
                }
            }];
        } else {
            [HUD hide:YES];
            NSLog(@"Error: %@ %@", error, [error userInfo]);

        }
    }   progressBlock:^(int percentDone) {
        HUD.progress = (float)percentDone/100;

    }];
    
}

- (IBAction)refreshImage:(id)sender
{
    refreshHUD = [[MBProgressHUD alloc] initWithView:self.view];
    refreshHUD.delegate = self;
    [refreshHUD show:YES];
}



#pragma mark UIImagePickerControllerDelegate

-(void)choosePhotoFromExistingImages
{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController * controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        controller.allowsEditing = NO;
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        controller.delegate = self;
        [self.navigationController presentViewController:controller animated:YES completion:nil];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    UIImage * image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    myImageView.contentMode = UIViewContentModeScaleAspectFit;
    myImageView.image = image;
    
    imageOfData = UIImageJPEGRepresentation(image, 0.05f);

    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


@end
