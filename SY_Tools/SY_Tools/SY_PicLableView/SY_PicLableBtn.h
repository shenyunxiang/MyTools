//
//  SY_PicLableBtn.h
//  SY_Tools
//
//  Created by GengLongtao on 16/4/19.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef  NS_ENUM(NSInteger, PicLabType){
    PicLabTypeTopImage = 1,     //图片在上方
    PicLabTypeLeftImage,        //图片在左方
    PicLabTypeRightImage,
    PicLabTypeBottomImage
    
};


@interface SY_PicLableBtn : UIButton

@property (nonatomic,copy)   NSString         *text;

@property (nonatomic,strong) UIImage          *image;

@property (nonatomic,strong) UIFont           *font;

@property (nonatomic,assign) CGFloat          sizeWidth;

@property (nonatomic,assign) CGFloat          sizeHeight;

@property (nonatomic,assign) CGFloat          space;


- (instancetype)initWithPicLabtype:(PicLabType)picLabtype;

@end
