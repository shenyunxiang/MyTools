//
//  SY_AddressBookModel.h
//  SY_Tools
//
//  Created by shenxunxiang on 16/5/7.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SY_AddressBookModel : NSObject
//名字
@property(nonatomic, copy) NSString     *firstName;
//姓氏
@property(nonatomic, copy) NSString     *lastName;
//名字的拼音音标
@property(nonatomic, copy) NSString     *firstNameTic;
//姓氏的拼音音标
@property(nonatomic, copy) NSString     *lastNameTic;
//电话
@property(nonatomic, strong) NSArray<NSString *>    *phoneNumberArr;


@end
