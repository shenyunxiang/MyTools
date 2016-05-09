//
//  SY_TagLableCell.h
//  SY_Tools
//
//  Created by shenxunxiang on 16/4/30.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SY_TagLableCell : UICollectionViewCell

@property(nonatomic, copy) NSString     *lableText;

@property(nonatomic, assign) CGFloat    space;


- (CGSize)sizeForCell;

@end
