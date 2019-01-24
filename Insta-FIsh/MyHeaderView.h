//
//  MyHeaderView.h
//  Insta-FIsh
//
//  Created by Jenny Chang on 23/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyHeaderView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UILabel *profileName;
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *profileCity;
@property (weak, nonatomic) IBOutlet UILabel *profileBio;


@end

NS_ASSUME_NONNULL_END
