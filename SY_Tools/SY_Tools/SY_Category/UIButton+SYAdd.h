//
//  UIButton+SYAdd.h
//  SY_Tools
//
//  Created by GengLongtao on 16/4/19.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SYAdd)

- (void)setNormalImage:(NSString *)imageStr;

- (void)setNormalImageWithImage:(UIImage *)image;

- (void)setSelectedImage:(NSString *)selectedImageStr;

- (void)setSelectedImageWithImage:(UIImage *)selectedImage;

- (void)addTouchupInsideWithTarget:(id)target action:(SEL)action;

- (void)addTouchDownWithTarget:(id)target action:(SEL)action;

- (void)addTouchDownRepeatWithTarget:(id)target action:(SEL)action;

@end
