//
//  UIView+SYAdd.h
//  SY_Tools
//
//  Created by shenxunxiang on 16/4/22.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kscreenSize     [UIScreen mainScreen].bounds.size
#define kfitWidth(w)    w * (kscreenSize.width / 320.0f)
#define kfitHeight(h)   h * (kscreenSize.height / 568.0f)

@interface UIView (SYAdd)

// frame
@property(nonatomic, assign) CGFloat    top;

@property(nonatomic, assign) CGFloat    left;

@property(nonatomic, assign) CGFloat    bottom;

@property(nonatomic, assign) CGFloat    right;

@property(nonatomic, assign) CGFloat    width;

@property(nonatomic, assign) CGFloat    height;

@property(nonatomic, assign) CGFloat    centerX;

@property(nonatomic, assign) CGFloat    centerY;

//UIImage
- (nullable UIImage *)snapshotImage;

- (void)removeAllSubviews;

@property (nullable, nonatomic, readonly) UIViewController *viewController;


@end
