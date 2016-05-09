//
//  SY_TagLableCell.m
//  SY_Tools
//
//  Created by shenxunxiang on 16/4/30.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import "SY_TagLableCell.h"
@interface SY_TagLableCell()

@property(nonatomic, strong) UILabel       *lable;

@end

@implementation SY_TagLableCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
        [self initUI];
        [self p_setDefaultProperty];
    }
    return self;
}

- (void)initUI{
    self.lable = [[UILabel alloc] init];
    [self.contentView addSubview:self.lable];
}

- (void)p_setDefaultProperty{
    self.lable.textColor = [UIColor blackColor];
    self.lable.backgroundColor = [UIColor clearColor];
    _space = 10;
}

- (void)setLableText:(NSString *)lableText{
    if (lableText == nil || [lableText isEqualToString:_lableText]) {
        return;
    }
    
    _lableText = lableText;
    self.lable.text = _lableText;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.lable.center = CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);
    
    if (self.layer.cornerRadius  == self.frame.size.height * 0.5) {
        return;
    }
    
    self.layer.cornerRadius  = self.frame.size.height * 0.5;
}

- (CGSize)sizeForCell{
    CGSize labSize = [_lable sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat cellHeight = _space * 2 + labSize.height;
    CGFloat cellWidth  = labSize.width + 2 * cellHeight;
    return CGSizeMake(cellWidth, cellHeight);
}

@end
