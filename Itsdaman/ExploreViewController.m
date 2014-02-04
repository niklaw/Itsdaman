//
//  ExploreViewController.m
//  Itsdaman
//
//  Created by Yash Varma on 2/3/14.
//  Copyright (c) 2014 Yash Varma. All rights reserved.
//

#import "ExploreViewController.h"

@interface ExploreViewController () <UITableViewDataSource, UITableViewDelegate>
{
    
    __weak IBOutlet UITableView *myTableView;
    __weak IBOutlet UISearchBar *mySearchBar;
}

@end

@implementation ExploreViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:@"ExplorerID" forIndexPath:indexPath];
    
    cell.textLabel.text = @"Yash is the Yash";
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}




@end
