//
//  XHTagsContainerViewModel.m
//  StudyDemo
//
//  Created by 许焕 on 2019/7/26.
//  Copyright © 2019 许焕. All rights reserved.
//

#import "XHTagsContainerViewModel.h"

NSString *const kTagModel = @"model";
NSString *const kTagRect  = @"rect";

@interface XHTagsContainerViewModel()

@property (nonatomic, copy)NSArray *tagsArr;
@property (nonatomic, assign)CGFloat maxWidth;
@property (nonatomic, assign)CGFloat totalHeight;
@property (nonatomic, strong)NSMutableArray <NSDictionary *> *tagFrames;

@end

@implementation XHTagsContainerViewModel

+ (instancetype)TagsContainerViewModelWithTagsArr:(NSArray *)tagsArr MaxWith:(CGFloat)maxWidth{
    return [[self alloc] initWithTagsArr:tagsArr MaxWith:maxWidth];
}

- (instancetype)initWithTagsArr:(NSArray *)tagsArr MaxWith:(CGFloat)maxWidth{
    if (self = [super init]) {
        self.maxWidth = maxWidth;
        self.tagsArr = tagsArr;
        [self configDefault];
    }
    return self;
}

- (void)configDefault{
    self.totalHeight = 0;
    self.fixedWidth = 0;
    self.marginX = 5;
    self.marginY = 5;
    self.tagH = 26;
    self.padding = 5;
    self.fontSize = 14;
}

- (void)configContainerHeight{
    CGFloat height = [self setupTagsWith:self.tagsArr MaxWidth:self.maxWidth];
    self.totalHeight += height;
}

- (CGFloat)setupTagsWith:(NSArray *)tags MaxWidth:(CGFloat)maxWidth{
    
    CGFloat tagW = self.fixedWidth;
    CGFloat tagH = self.tagH;
    CGFloat tagX = 0;
    CGFloat tagY = 0;
    
    CGFloat marginX = self.marginX;
    CGFloat marginY = self.marginY;
    CGFloat padding = self.padding;
    
    [self.tagFrames removeAllObjects];
    for (NSInteger i = 0; i < tags.count; i++) {
        //默认传入字符串标签
        NSString *value = tags[i];
        if (self.fixedWidth > 0) {
            tagW = self.fixedWidth;
        }else{
            tagW = [XHTagsContainerViewModel getWidthWithText:value Height:tagH FontSize:self.fontSize] + padding * 2;
            if (tagW > maxWidth) {
                tagW = maxWidth;
            }
        }
        if ((tagX + tagW) > maxWidth) {
            tagX = 0;
            tagY = tagY + marginY + tagH;
        }
        CGRect rect = CGRectMake(tagX, tagY, tagW, tagH);
        NSDictionary *dic = @{kTagModel:value,kTagRect:[NSValue valueWithCGRect:rect]};
        tagX = tagX + tagW + marginX;
        [self.tagFrames addObject:dic];
    }
    return tagH + tagY;
}

- (NSMutableArray<NSDictionary *> *)tagFrames{
    if (!_tagFrames) {
        _tagFrames = [NSMutableArray array];
    }
    return _tagFrames;
}


+ (CGFloat)getWidthWithText:(NSString *)text Height:(CGFloat)height FontSize:(CGFloat)fontSize
{
    CGSize size = [self getSizeWithText:text inputSize:CGSizeMake(MAXFLOAT, height) FontSize:fontSize];
    return size.width;
}

+ (CGSize)getSizeWithText:(NSString *)text inputSize:(CGSize)size FontSize:(CGFloat)fontSize
{
    CGSize resultSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    return resultSize;
}

@end
