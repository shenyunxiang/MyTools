//
//  SY_BaseTableViewCell.h
//  SY_Tools
//
//  Created by shenxunxiang on 16/5/9.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SY_BaseTableViewCell : UITableViewCell


//@property(nonatomic, assign) BOOL           canEditable;
//
//@property(nonatomic, assign) BOOL           canSelected;

@property(nonatomic, strong) UIImage            *selectedImage;

@property(nonatomic, strong) UIImage            *noSelectedImage;

@property(nonatomic, strong) UIImageView        *iconImageView;

@property(nonatomic, strong) UIImageView        *selectedImageView;

@property(nonatomic, strong) UILabel            *topLable;

@property(nonatomic, strong) UILabel            *bottomLable;

//改变UI布局，需要重写
- (void)initUI;
//设置控件的属性，需要重写
- (void)setDefaultProperty;

- (void)setCanEditable:(BOOL)canEditable Selectable:(BOOL)selectable;

@end
