//
//  SHCZNews.m
//  test1
//
//  Created by Devil on 16/1/4.
//  Copyright © 2016年 Devil. All rights reserved.
//

#import "SHCZNews.h"
#import "UIView+SHCZExt.h"


@interface SHCZNews ()


@end

@implementation SHCZNews

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSubViews];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置基本控件
-(void)setSubViews{
    self.navigationItem.title=@"消息";
//    分段控件
    UISegmentedControl *segmentC=[[UISegmentedControl alloc]initWithItems:@[@"消息",@"电话"]];
    segmentC.w=120;
    segmentC.selectedSegmentIndex=0;
    
    self.navigationItem.titleView=segmentC;
//搜索栏
    UISearchBar *sB=[[UISearchBar alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,44)];
    [sB setPlaceholder:@"搜索"];
    
    [self.tableView addSubview:sB];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

@end
