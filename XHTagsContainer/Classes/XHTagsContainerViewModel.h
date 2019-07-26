//
//  XHTagsContainerViewModel.h
//  StudyDemo
//
//  Created by 许焕 on 2019/7/26.
//  Copyright © 2019 许焕. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

UIKIT_EXTERN NSString *const kTagModel;
UIKIT_EXTERN NSString *const kTagRect;

@interface XHTagsContainerViewModel : NSObject

+ (instancetype)TagsContainerViewModelWithTagsArr:(NSArray *)tagsArr MaxWith:(CGFloat)maxWidth;

/**标签高度*/
@property (nonatomic, assign)CGFloat tagH;
/**标签设置固定宽度(一般不设置)*/
@property (nonatomic, assign)CGFloat fixedWidth;
/**标签字体大小*/
@property (nonatomic, assign)CGFloat fontSize;
/**标签内边距*/
@property (nonatomic, assign)CGFloat padding;
/**标签X轴的margin*/
@property (nonatomic, assign)CGFloat marginX;
/**标签Y轴的margin*/
@property (nonatomic, assign)CGFloat marginY;

//主动调用计算container 高度
- (void)configContainerHeight;

//容器视图的高度
@property (nonatomic, readonly)CGFloat totalHeight;
//转化后的数据创建标签使用
@property (nonatomic, readonly)NSMutableArray <NSDictionary *> *tagFrames;

@end

NS_ASSUME_NONNULL_END
