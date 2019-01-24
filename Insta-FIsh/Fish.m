//
//  Fish.m
//  Insta-FIsh
//
//  Created by Jenny Chang on 23/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import "Fish.h"


@implementation Fish

-(instancetype)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        self.image = image;
    }
    return self;
}

@end
