//
//  SY_GridView.m
//  SY_Tools
//
//  Created by shenxunxiang on 16/6/3.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import "SY_GridView.h"
#import <Masonry.h>
#import "SY_PicLableBtn.h"
@implementation SY_GridView

- (void)defaultConfig{
    self.backgroundColor= [UIColor clearColor];
}

- (void)makeGridView{
    
    NSArray *titles = @[@[@"测试", @"测试", @"测试"], @[@"测试", @"测试", @"测试"]];
    NSArray *images = @[@[@"addressBook_default_userIcon", @"addressBook_default_userIcon", @"addressBook_default_userIcon"], @[@"addressBook_default_userIcon", @"addressBook_default_userIcon", @"addressBook_default_userIcon"]];
    SY_PicLableBtn *lastBtn;
    for (int i = 0; i < titles.count; i++) {
        for (int j = 0; j < [titles[i] count]; j++) {
            
            SY_PicLableBtn *btn = [[SY_PicLableBtn alloc] initWithPicLabtype:PicLabTypeTopImage];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                if (lastBtn == nil) {
                    
                }
                
                
            }];
            lastBtn = btn;
            
        }
    }
    
    
}

@end
