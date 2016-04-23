//
//  ViewController.m
//  SY_Tools
//
//  Created by GengLongtao on 16/4/19.
//  Copyright © 2016年 shenyunxiang. All rights reserved.
//

#import "ViewController.h"
#import "SY_PicLableBtn.h"

#import "UITableView+SYAdd.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    SY_PicLableBtn *top = [[SY_PicLableBtn alloc]initWithPicLabtype:PicLabTypeTopImage];
    [self.view addSubview:top];
    top.text = @"角标";
    top.image = [UIImage imageNamed:@"角标"];
    top.frame= CGRectMake(60, 100, top.sizeWidth, top.sizeHeight);
    
    
    SY_PicLableBtn *bottom = [[SY_PicLableBtn alloc]initWithPicLabtype:PicLabTypeBottomImage];
    [self.view addSubview:bottom];
    bottom.text = @"角标";
    bottom.image = [UIImage imageNamed:@"角标"];
    bottom.frame= CGRectMake(60, top.frame.origin.y+top.frame.size.height + 10, bottom.sizeWidth, bottom.sizeHeight);
    
    
    SY_PicLableBtn *left = [[SY_PicLableBtn alloc]initWithPicLabtype:PicLabTypeLeftImage];
    [self.view addSubview:left];
    left.text = @"角标";
    left.image = [UIImage imageNamed:@"角标"];
    left.frame= CGRectMake(60, bottom.frame.origin.y+bottom.frame.size.height + 10, left.sizeWidth, left.sizeHeight);
    
    SY_PicLableBtn *right = [[SY_PicLableBtn alloc]initWithPicLabtype:PicLabTypeRightImage];
    [self.view addSubview:right];
    right.text = @"角标";
    right.image = [UIImage imageNamed:@"角标"];
    right.frame= CGRectMake(60, left.frame.origin.y+left.frame.size.height + 10, right.sizeWidth, right.sizeHeight);
    
    [self testAssociate];
    
}

- (void)testAssociate{
    UITableView *table = [[UITableView alloc]init];
    table.sy_defaultCellHeight = 100;
    NSLog(@"------>%f", table.sy_defaultCellHeight);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
