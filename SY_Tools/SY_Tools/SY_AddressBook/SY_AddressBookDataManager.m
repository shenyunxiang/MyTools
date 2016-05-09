//
//  SY_AddressBookDataManager.m
//  SY_Tools
//
//  Created by shenxunxiang on 16/5/7.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import "SY_AddressBookDataManager.h"
#import <AddressBook/AddressBook.h>
#import <Contacts/Contacts.h>
#import "SY_AddressBookModel.h"
@interface SY_AddressBookDataManager ()

@property(nonatomic, strong) NSMutableArray               *dataSource;

@property(nonatomic, strong) NSMutableDictionary          *dataDic;

@property(nonatomic, weak)   id<SY_AddressBookDataManagerDelegate>      delegate;

@property(nonatomic, assign) SortType                      sortType;



@end
@implementation SY_AddressBookDataManager

- (instancetype)initWithDelegate:(id<SY_AddressBookDataManagerDelegate>)delegate
                     andSortType:(SortType)sortType{
    
    if (self = [super init]) {
        _delegate = delegate;
        _sortType = sortType;
    }
    
    return self;
}

- (void)personDataRequest{
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
    //获取通讯录权限
    ABAuthorizationStatus authorization = ABAddressBookGetAuthorizationStatus();
    
    if (authorization == kABAuthorizationStatusNotDetermined) {
        
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
            if (granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self p_getPeopleAddBookInfo];
                });
            }
            CFRelease(addressBookRef);
        });
        
    } else if (authorization == kABAuthorizationStatusAuthorized){
        [self p_getPeopleAddBookInfo];
    } else {
        
    }
    
}


- (void)p_getPeopleAddBookInfo{
    CFErrorRef *error1 = NULL;
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error1);
    CFIndex numberOfPeople = ABAddressBookGetPersonCount(addressBook);
    CFArrayRef people = ABAddressBookCopyArrayOfAllPeople(addressBook);
    
    
    for (int i = 0; i < numberOfPeople; i++) {
        SY_AddressBookModel *model = [[SY_AddressBookModel alloc]init];
        ABRecordRef personInfo = CFArrayGetValueAtIndex(people, i);
        //名字
        model.firstName = (__bridge NSString *)(ABRecordCopyValue(personInfo, kABPersonFirstNameProperty));
        //姓氏
        model.lastName = (__bridge NSString *)(ABRecordCopyValue(personInfo, kABPersonLastNameProperty));
        //读取firstname拼音音标
        model.firstNameTic = [self transformToPinyinWith:model.firstName];
        //读取lastname拼音音标
        model.lastNameTic = [self transformToPinyinWith:model.lastName];
        
        NSLog(@"名字音标>>>>>%@,%@",(__bridge NSString*)ABRecordCopyValue(personInfo, kABPersonFirstNamePhoneticProperty),  (__bridge NSString*)ABRecordCopyValue(personInfo, kABPersonLastNamePhoneticProperty));
        
        //读取电话多值
        ABMultiValueRef phone = ABRecordCopyValue(personInfo, kABPersonPhoneProperty);
        NSMutableArray *tempArr = [NSMutableArray array];
        for (int k = 0; k<ABMultiValueGetCount(phone); k++)
        {
            //获取电话Label
//            NSString * personPhoneLabel = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(ABMultiValueCopyLabelAtIndex(phone, k));
            //获取該Label下的电话值
            NSString * personPhone = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phone, k);
            [tempArr addObject:personPhone];
        }
        CFRelease(phone);
        model.phoneNumberArr = tempArr;
        [self.dataSource addObject:model];
    }
    
    CFRelease(addressBook);
    CFRelease(people);
    
    if (_sortType == SortTypeNone) {
        if (_delegate && [_delegate respondsToSelector:@selector(didReceiveAddressBookData:andArraySorted:)]) {
            [_delegate didReceiveAddressBookData:self.dataSource andArraySorted:nil];
        }
    }else {
        [self sortAddressBookPeopleData];
    }
    
}


- (void)addPersonWithName:(NSString *)name workNumber:(NSString *)workNumber
{
    ABAddressBookRef  addressBook = ABAddressBookCreate();
    //创建一条记录
    ABRecordRef recordRef = ABPersonCreate();
    //添加
    ABRecordSetValue(recordRef,kABPersonLastNameProperty,(__bridge CFTypeRef)(name),NULL);
    //创建一个多值属性，因为手机号可以有多个
    ABMutableMultiValueRef multiValueRef = ABMultiValueCreateMutable(kABStringPropertyType);
    //向多值属性中添加工作电话
    ABMultiValueAddValueAndLabel(multiValueRef,(__bridge CFStringRef)(workNumber),kABWorkLabel,NULL);
    //添加属性到指定记录，这里添加的是多值属性
    ABRecordSetValue(recordRef, kABPersonPhoneProperty, multiValueRef, NULL);
    //添加记录到通讯录
    ABAddressBookAddRecord(addressBook, recordRef, NULL);
    //保存通讯录，提交更改
    ABAddressBookSave(addressBook, NULL);
    //释放资源
    CFRelease(recordRef);
    CFRelease(multiValueRef);
}


- (NSString *)transformToPinyinWith:(NSString*) str{
    
    if(str == nil){
        return nil;
    }
    
    NSMutableString *mutableString = [NSMutableString stringWithString:str];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    mutableString = (NSMutableString *)[mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    return [[[mutableString stringByReplacingOccurrencesOfString:@"'" withString:@""] substringToIndex:1] uppercaseString];
    
}


- (void)sortAddressBookPeopleData{
    
    for (SY_AddressBookModel *model in self.dataSource) {
        NSString *sortKey;
        if (model.lastNameTic != nil) {
            sortKey = model.lastNameTic;
        } else if (model.firstNameTic != nil){
            sortKey = model.firstNameTic;
        } else{
            sortKey = @"#";
        }
        
        //
        if (![[self.dataDic allKeys] containsObject:sortKey]) {
            NSMutableArray *tempArr = [NSMutableArray array];
            [tempArr addObject:model];
            [self.dataDic setObject:tempArr forKey:sortKey];
        } else {
            [self.dataDic[sortKey] addObject:model];
        }
    }
    
    NSMutableArray *allKeys = [[self.dataDic allKeys] mutableCopy];
    [allKeys removeObject:@"#"];
    
    [allKeys sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    [allKeys addObject:@"#"];
    if (_delegate && [_delegate respondsToSelector:@selector(didReceiveAddressBookData:andArraySorted:)]) {
        [_delegate didReceiveAddressBookData:self.dataDic andArraySorted:allKeys];
    }
    
}

- (NSMutableDictionary *)dataDic{
    if (_dataDic == nil) {
        _dataDic = [NSMutableDictionary dictionary];
    }
    return _dataDic;
}

- (NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

@end
