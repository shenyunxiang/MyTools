//
//  ViewController.m
//  SY_Tools
//
//  Created by GengLongtao on 16/4/19.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import "ViewController.h"
#import "SY_PicLableBtn.h"
#import "SY_AddressBook/SY_AddressBookDataManager.h"
#import "UITableView+SYAdd.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loadAddressBookAction:(id)sender {
    
    SY_AddressBookDataManager *manager = [[SY_AddressBookDataManager alloc]init];
    [manager addPersonWithName:@"沈云" workNumber:@"1231212"];
    [manager personDataRequest];
    
}

@end
