//
//  SHCZContacter.m
//  test1
//
//  Created by Devil on 16/1/4.
//  Copyright © 2016年 Devil. All rights reserved.
//

#import "SHCZContacter.h"


@interface SHCZContacter ()


@end

@implementation SHCZContacter

- (void)viewDidLoad {
    [super viewDidLoad];
         self.navigationItem.title=@"联系人";
        //搜索栏
    UISearchBar *sB=[[UISearchBar alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,44)];
    [sB setPlaceholder:@"搜索"];
    
    [self.tableView addSubview:sB];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}


@end
