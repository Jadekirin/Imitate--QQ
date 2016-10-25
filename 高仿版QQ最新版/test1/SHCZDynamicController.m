//
//  SHCZDynamicController.m
//  test1
//
//  Created by Devil on 16/1/4.
//  Copyright © 2016年 Devil. All rights reserved.
//

#import "SHCZDynamicController.h"

@interface SHCZDynamicController ()


@end

@implementation SHCZDynamicController



- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title=@"动态";
    
    //搜索栏
    UISearchBar *sB=[[UISearchBar alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,44)];
    [sB setPlaceholder:@"搜索电影/音乐/商品..."];
    
    [self.tableView addSubview:sB];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (indexPath.row==1) {
        cell.imageView.image=[UIImage imageNamed:@"tab_qworld_nor"];
        cell.textLabel.text=@"空间";
    }
    
    return cell;
}


@end
