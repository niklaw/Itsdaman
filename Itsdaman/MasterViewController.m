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

@interface MasterViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UITabBarDelegate>
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

//-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
//{
//    if (item.tag == 1) {
//        <#statements#>
//    } else if (item.tag == 2) {
//        
//    } else if (item.tag == 3) {
//        
//    } else if (item.tag == 4) {
//        
//    }
//    
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
