//
//  SY_PicLableBtn.m
//  SY_Tools
//
//  Created by GengLongtao on 16/4/19.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import "SY_PicLableBtn.h"

@interface SY_PicLableBtn ()

@property (nonatomic,assign) PicLabType      piclabType;

@property (nonatomic,assign) CGSize          labSize;

@end

@implementation SY_PicLableBtn




- (instancetype)initWithPicLabtype:(PicLabType)picLabtype
{
    self = [super init];
    if (self) {
        _piclabType = picLabtype;
        [self _setDefaultProperty];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    [self _adjustLayout];
}



#pragma mark ---- Private ----
- (void)_setDefaultProperty{
    self.font = [UIFont systemFontOfSize:14.0];
    self.space = 4.0;
    self.sizeWidth = 0.0;
    self.sizeHeight = 0.0;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

//计算文字的size
- (void)_calculateSize{
    NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    NSDictionary *dic = @{NSFontAttributeName:_font, NSParagraphStyleAttributeName:textStyle};
    
    CGSize size =  [_text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGRectGetHeight(self.bounds)) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    
    self.labSize = size;
    
    [self _calculateFrameWithLabSize:size];
    
}

//计算frame的大小
- (void)_calculateFrameWithLabSize:(CGSize)size{
    
    if (self.piclabType == PicLabTypeTopImage || self.piclabType == PicLabTypeBottomImage) {
        
        self.sizeWidth  = MAX(ceilf(size.width) + 1, _image.size.width);
        self.sizeHeight = ceilf(size.height)   + 1 + _space + _image.size.height;
        
    } else if(self.piclabType == PicLabTypeLeftImage || self.piclabType == PicLabTypeRightImage){
        
        self.sizeWidth =  ceilf(size.width) + 1 + _space + _image.size.width;
        self.sizeHeight = MAX(ceilf(size.height) + 1, _image.size.height);
        
    }
}

//调整布局
- (void)_adjustLayout{
    
    CGFloat imageW = _image.size.width;
    CGFloat imageH = _image.size.height;
    
    if (self.piclabType == PicLabTypeTopImage) {
        
        self.imageView.frame = CGRectMake((self.sizeWidth - imageW)/2.0f, 0, imageW, imageH);
        CGFloat labY = imageH + self.imageView.frame.origin.y + _space;
        self.titleLabel.frame = CGRectMake((self.sizeWidth - self.labSize.width)/2.0f, labY, self.labSize.width, _font.lineHeight);
        
    } else if(self.piclabType == PicLabTypeBottomImage){
        
        self.titleLabel.frame = CGRectMake((self.sizeWidth - self.labSize.width)/2.0f, 0, self.labSize.width, _font.lineHeight);
        CGFloat imageViewY = _font.lineHeight + self.titleLabel.frame.origin.y + _space;
        self.imageView.frame = CGRectMake((self.sizeWidth - imageW)/2.0f, imageViewY, imageW, imageH);
        
        
    } else if (self.piclabType == PicLabTypeLeftImage){
        
        self.imageView.frame = CGRectMake(0, (self.sizeHeight - imageH)/2.0f, imageW, imageH);
        CGFloat labX = imageW + _space + self.imageView.frame.origin.x ;
        self.titleLabel.frame = CGRectMake(labX, (self.sizeHeight - _font.lineHeight)/2.0f, self.labSize.width , _font.lineHeight);
        
    }else if (self.piclabType == PicLabTypeRightImage){
        
        self.titleLabel.frame = CGRectMake(0, (self.sizeHeight - _font.lineHeight)/2.0f, self.labSize.width, _font.lineHeight);
        CGFloat imageViewX = self.titleLabel.frame.origin.x + self.labSize.width +_space;
        self.imageView.frame = CGRectMake(imageViewX, (self.sizeHeight - imageH)/2.0f, imageW, imageH);
        
    }
    
    
}


#pragma mark ---- Setter ----
- (void)setText:(NSString *)text{
    if (text.length == 0 || [_text isEqualToString:text]) {
        return;
    }
    
    _text = text;
    [self setTitle:_text forState:UIControlStateNormal];
    
    if (_image) {
        [self _calculateSize];
    }
}

- (void)setImage:(UIImage *)image{
    _image = image;
    [self setImage:_image forState:UIControlStateNormal];
    if (_text) {
        [self _calculateSize];
    }
    
}

-(void)setFont:(UIFont *)font{
    _font = font;
    self.titleLabel.font = font;
    
}



@end
