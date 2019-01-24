//
//  MyCollectionViewCell.m
//  Insta-FIsh
//
//  Created by Jenny Chang on 23/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

// reuse cells

- (void)prepareForReuse {
    self.fishImage.image = nil;
    self.layer.borderWidth = 0;
}

@end
