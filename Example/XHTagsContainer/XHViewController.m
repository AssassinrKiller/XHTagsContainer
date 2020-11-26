//
//  XHViewController.m
//  XHTagsContainer
//
//  Created by ios_service@126.com on 07/26/2019.
//  Copyright (c) 2019 ios_service@126.com. All rights reserved.
//

#import "XHViewController.h"
#import "XHTableViewCell.h"
#import "XHTagsContainer.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface XHViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataSource;
@end

@implementation XHViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:XHTableViewCell.class forCellReuseIdentifier:@"XHTableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self fetchData];
    [self.tableView reloadData];
}

- (void)fetchData{
    NSArray *arr0 = @[@"草莓",@"蓝莓",@"黑莓",@"桑葚",@"覆盆子",@"葡萄",@"青提",@"红提",@"水晶葡萄",@"马奶子"];
    NSArray *arr1 = @[@"蜜橘",@"砂糖橘",@"金橘",@"蜜柑",@"甜橙",@"脐橙",@"西柚",@"柚子",@"葡萄柚",@"柠檬",@"文旦",@"莱姆"];
    NSArray *arr2 = @[@"油桃",@"蟠桃",@"水蜜桃",@"黄桃",@"李子",@"樱桃",@"杏",@"梅子",@"杨梅"];
    NSArray *arr3 = @[@"空气循环装置的",@"并不是我的专业领域",@"并不是我的专业领域",@"并不是我的专业领域",@"并不是我的专业领域"];
    
    NSArray *dataSource = @[arr0,arr1,arr2,arr3];
    self.dataSource = [NSMutableArray array];
    for (NSArray *arr in dataSource) {
        XHTagsContainerViewModel *vm = [XHTagsContainerViewModel TagsContainerViewModelWithTagsArr:arr MaxWith:SCREEN_WIDTH - 30];
        vm.tagH = 30;
        vm.fontSize = 15;
        vm.padding = 20;
        vm.marginX = 10;
        vm.marginY = 10;
        [vm configContainerHeight];
        [self.dataSource addObject:vm];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    XHTagsContainerViewModel *vm = self.dataSource[indexPath.row];
    return vm.totalHeight + 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XHTableViewCell"];
    [cell configWithModel:self.dataSource[indexPath.row]];
    return cell;
}



@end
