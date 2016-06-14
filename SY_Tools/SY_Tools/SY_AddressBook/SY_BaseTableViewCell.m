//
//  SY_BaseTableViewCell.m
//  SY_Tools
//
//  Created by shenxunxiang on 16/5/9.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import "SY_BaseTableViewCell.h"
#import <Masonry.h>
@implementation SY_BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initUI];
        [self setDefaultProperty];
    }
    
    return self;
}

- (void)initUI{
    self.iconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.iconImageView];
    
    self.topLable = [[UILabel alloc] init];
    [self.contentView addSubview:self.topLable];
    
    self.bottomLable = [[UILabel alloc] init];
    [self.contentView addSubview:self.bottomLable];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(15);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        //        make.size.mas_equalTo(CGSizeMake(36, 36));
    }];
    
    [self.topLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).mas_offset(15);
        make.bottom.mas_equalTo(self.iconImageView.mas_centerY).mas_offset(0);
        make.width.mas_equalTo(150);
    }];
    
    [self.bottomLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconImageView.mas_centerY).mas_offset(2.5);
        make.left.mas_equalTo(self.topLable);
        make.width.mas_equalTo(self.topLable);
    }];
    
    [self.selectedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).mas_offset(-20);
    }];
}

- (void)setDefaultProperty{
    self.bottomLable.textColor = [UIColor lightGrayColor];
    self.bottomLable.font = [UIFont systemFontOfSize:12.0f];
    self.iconImageView.image = [UIImage imageNamed:@"addressBook_default_userIcon"];
    self.selectedImageView.image = [UIImage imageNamed:@"unSelected"];
}

- (void)setCanEditable:(BOOL)canEditable Selectable:(BOOL)selectable{
    if (canEditable) {
        self.selectedImageView.hidden = NO;
    } else {
        self.selectedImageView.hidden = YES;
        [self updateUIWith:selectable];
    }
}

- (void)updateUIWith:(BOOL)selectable{
    
    if (selectable) {
        self.selectedImageView.image = self.selectedImage;
    } else {
        self.selectedImageView.image = self.noSelectedImage;
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
