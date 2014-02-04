//
//  ViewController.m
//  Itsdaman
//
//  Created by Yash Varma on 2/3/14.
//  Copyright (c) 2014 Yash Varma. All rights reserved.
//

#import "MasterViewController.h"
#import "ExploreViewController.h"
#import "ProfileViewController.h"
#import "CameraViewController.h"

#import "Itsdaman.h"

@interface MasterViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UITabBarDelegate, PFSignUpViewControllerDelegate>
{
    
    __weak IBOutlet UICollectionView *myCollectionView;
}
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Itsdaman * cell = [myCollectionView dequeueReusableCellWithReuseIdentifier:@"ItsdamanCell" forIndexPath:indexPath];
    
    return cell;
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

-(void)viewDidAppear:(BOOL)animated
{
    if (![PFUser currentUser]) {
        PFLogInViewController *login = [PFLogInViewController new];
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectZero];
        login.signUpController.delegate = self;
        label.text = @"Octopus Login";
        [label sizeToFit];
        login.logInView.logo = label;
        [self presentViewController:login animated:YES completion:nil];
    }
}

-(void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{
    [signUpController dismissViewControllerAnimated:YES completion:nil];
}


@end
