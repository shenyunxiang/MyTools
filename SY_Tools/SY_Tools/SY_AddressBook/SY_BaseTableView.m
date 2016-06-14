//
//  SY_BaseTableView.m
//  SY_Tools
//
//  Created by shenxunxiang on 16/5/9.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import "SY_BaseTableView.h"
#import "SY_BaseTableViewCell.h"
@interface SY_BaseTableView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation SY_BaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate   = self;
    }
    return self;
}



#pragma mark ------ UITableView Delegate -----
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SY_BaseTableViewCell *cell = [_SY_customDelegate SY_BaseTableView:self cellForRowAtIndexPath:indexPath];
   
    if (self.caneditable) {
        if ([self.selectedRow containsObject:indexPath]) {
            [cell setCanEditable:self.caneditable Selectable:YES];
        } else {
            [cell setCanEditable:self.caneditable Selectable:NO];
        }
    } else {
        [cell setCanEditable:self.caneditable Selectable:NO];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.caneditable) {
        
        if ([self.selectedRow containsObject:indexPath]) {
            [self.selectedRow removeObject:indexPath];
        } else {
            
            if (self.selectType == SelectTypeMutable) {
                [self.selectedRow addObject:indexPath];
            } else {
                [self.selectedRow removeAllObjects];
                [self.selectedRow addObject:indexPath];
            }
        }
        [self reloadData];
        
    } else {
     
        if (_SY_customDelegate && [_SY_customDelegate respondsToSelector:@selector(SY_BaseTableView:didSelectRowAtIndexPath:)]) {
            [_SY_customDelegate SY_BaseTableView:self didSelectRowAtIndexPath:indexPath];
        }
        
    }
    
}


- (NSMutableArray<NSIndexPath *> *)selectedRow{
    if (_selectedRow == nil) {
        _selectedRow = [NSMutableArray array];
    }
    return _selectedRow;
}


@end
