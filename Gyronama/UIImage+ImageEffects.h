//
//  UIImage+ImageEffects.h
//  Gyronama
//
//  Created by SpidrWeb on 3/30/14.
//  Copyright (c) 2014 BrainGears Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@import UIKit;


@interface UIImage (ImageEffects)


- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;


@end
