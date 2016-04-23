//
//  UITableView+SYAdd.h
//  SY_Tools
//
//  Created by shenxunxiang on 16/4/23.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (SYAdd)

#pragma mark ---- cell 折叠 ----
//默认的cell的高度
@property(nonatomic, assign) CGFloat    sy_defaultCellHeight;
//需要关闭的section的集合
-(NSMutableIndexSet *)sy_closeSections;
//关闭某个section
- (void)closeSection:(NSInteger)section;
//返回cell的高度  关闭时为0，打开时为设置的cell高度
- (CGFloat)sy_configCellHeightInSection:(NSInteger)section;



@end
