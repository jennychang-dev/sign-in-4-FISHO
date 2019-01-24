//
//  Fish.h
//  Insta-FIsh
//
//  Created by Jenny Chang on 23/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Fish : NSObject

@property UIImage *image;

-(instancetype)initWithImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
