//
//  UIButton+SYAdd.m
//  SY_Tools
//
//  Created by GengLongtao on 16/4/19.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import "UIButton+SYAdd.h"

@implementation UIButton (SYAdd)

#pragma mark ---- 设置图片 ----
- (void)setNormalImage:(NSString *)imageStr{
    [self setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
}

- (void)setNormalImageWithImage:(UIImage *)image{
    [self setImage:image forState:UIControlStateNormal];
}

- (void)setSelectedImage:(NSString *)selectedImageStr{
    [self setImage:[UIImage imageNamed:selectedImageStr] forState:UIControlStateSelected];
}

- (void)setSelectedImageWithImage:(UIImage *)selectedImage{
    [self setImage:selectedImage forState:UIControlStateSelected];
}

#pragma mark ---- 点击事件 ----
- (void)addTouchupInsideWithTarget:(id)target action:(SEL)action{
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)addTouchDownWithTarget:(id)target action:(SEL)action{
    [self addTarget:target action:action forControlEvents:UIControlEventTouchDown];
}

- (void)addTouchDownRepeatWithTarget:(id)target action:(SEL)action{
    [self addTarget:target action:action forControlEvents:UIControlEventTouchDownRepeat];
}



@end
