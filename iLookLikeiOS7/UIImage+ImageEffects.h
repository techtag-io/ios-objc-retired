//
//  UIImage+ImageEffects.h
//  iLookLikeiOS7
//
//  Created by SpidrWeb on 8/14/13.
//  Copyright (c) 2013 BrainGears Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@import UIKit;


@interface UIImage (ImageEffects)
- (UIImage *)applyLightEffect;
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;



@end
