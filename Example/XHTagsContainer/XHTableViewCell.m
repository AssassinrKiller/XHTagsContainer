//
//  XHTableViewCell.m
//  XHTagsContainer_Example
//
//  Created by 许焕 on 2019/7/26.
//  Copyright © 2019 ios_service@126.com. All rights reserved.
//

#import "XHTableViewCell.h"
#import "XHTagsContainer.h"

@interface XHTableViewCell()<XHTagsContainerDelegate>
@property (nonatomic, strong)XHTagsContainer *container;
@end

@implementation XHTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = 0;
    }
    return self;
}

- (void)configWithModel:(id)model{
    XHTagsContainerViewModel *vm = (XHTagsContainerViewModel *)model;
    if (self.container) return;
    self.container = [[XHTagsContainer alloc] initWithViewModel:vm];
    [self.container drawTags];
    self.container.delegate = self;
    [self.contentView addSubview:self.container];
    self.container.frame = CGRectMake(15, 10, [UIScreen mainScreen].bounds.size.width - 30, vm.totalHeight);
}

- (void)selectedTagWithIndex:(NSInteger)index{
    NSLog(@"%@",[NSString stringWithFormat:@"点击第%ld个",index]);
}

- (void)clearAllSelectedState{
    NSLog(@"清除所有标签选中状态");
}

- (void)clearStateWithIndex:(NSInteger)index{
    NSLog(@"%@",[NSString stringWithFormat:@"单选模式清除上一个状态 index:%ld",index]);
    
}

@end
