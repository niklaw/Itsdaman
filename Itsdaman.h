//
//  Itsdaman.h
//  Itsdaman
//
//  Created by Yash Varma on 2/3/14.
//  Copyright (c) 2014 Yash Varma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Itsdaman : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *myLikesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UIButton *myLikeButton;
@property (weak, nonatomic) IBOutlet UIButton *myCommentButton;
@property (weak, nonatomic) IBOutlet UILabel *myUserLabel;

@end
