//
//  SY_BaseTableView.h
//  SY_Tools
//
//  Created by shenxunxiang on 16/5/9.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SY_BaseTableView;
@class SY_BaseTableViewCell;
typedef  NS_ENUM(NSInteger, SelectType){
    SelectTypeMutable = 0,
    SelectTypeSingle
};


@protocol SY_BaseTableViewDelegate <NSObject>

- (void)SY_BaseTableView:(SY_BaseTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

- (SY_BaseTableViewCell *)SY_BaseTableView:(SY_BaseTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface SY_BaseTableView : UITableView

//选中的cell
@property(nonatomic, strong) NSMutableArray<NSIndexPath *>        *selectedRow;
//是否可以编辑
@property(nonatomic, assign) BOOL    caneditable;
//单选，还是多选
@property(nonatomic, assign) SelectType    selectType;


@property(nonatomic, weak)   id<SY_BaseTableViewDelegate>      SY_customDelegate;


@end
