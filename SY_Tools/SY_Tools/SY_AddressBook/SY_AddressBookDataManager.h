//
//  SY_AddressBookDataManager.h
//  SY_Tools
//
//  Created by shenxunxiang on 16/5/7.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  NS_ENUM(NSInteger, SortType){
    SortTypeNone = 1, //不整理数据
    SortTypeSorted
};

@protocol SY_AddressBookDataManagerDelegate <NSObject>

- (void)didReceiveAddressBookData:(id)dataSource andArraySorted:(NSArray *)array;

@end

@interface SY_AddressBookDataManager : NSObject

- (instancetype)initWithDelegate:(id<SY_AddressBookDataManagerDelegate>)delegate
                     andSortType:(SortType)sortType;
/**
 *  获取通讯录信息
 */
- (void)personDataRequest;
/**
 *  添加联系人信息
 *
 *  @param name       名字
 *  @param workNumber 电话
 */
- (void)addPersonWithName:(NSString *)name workNumber:(NSString *)workNumber;

@end
