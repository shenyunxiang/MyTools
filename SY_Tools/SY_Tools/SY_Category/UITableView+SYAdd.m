//
//  UITableView+SYAdd.m
//  SY_Tools
//
//  Created by shenxunxiang on 16/4/23.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import "UITableView+SYAdd.h"
#import <objc/runtime.h>


@implementation UITableView (SYAdd)

- (CGFloat)sy_defaultCellHeight{
    return [objc_getAssociatedObject(self, @selector(sy_defaultCellHeight)) floatValue];
}

- (void)setSy_defaultCellHeight:(CGFloat)sy_defaultCellHeight{
    objc_setAssociatedObject(self, @selector(sy_defaultCellHeight), @(sy_defaultCellHeight), OBJC_ASSOCIATION_ASSIGN);
}

- (NSMutableIndexSet *)sy_closeSections{
    NSMutableIndexSet *set = objc_getAssociatedObject(self, @selector(sy_closeSections));
    if (set == nil) {
        set = [NSMutableIndexSet indexSet];
        objc_setAssociatedObject(self, @selector(sy_closeSections), set, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return set;
}

- (CGFloat)sy_configCellHeightInSection:(NSInteger)section{
    if ([self.sy_closeSections containsIndex:section]) {
        return 0;
    } else {
        NSAssert(self.sy_defaultCellHeight != 0, @"must give a defautl height for cell by ado_defaultCellHeigt");
        return self.sy_defaultCellHeight;
    }
}


- (void)closeSection:(NSInteger)section{
    
    if ([self.sy_closeSections containsIndex:section]) {
        
        [self.sy_closeSections removeIndex:section];
        
    } else {
        [self.sy_closeSections addIndex:section];
    }
    
    [self reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
    
}



@end
