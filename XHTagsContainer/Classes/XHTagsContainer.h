//
//  XHTagsContainer.h
//  StudyDemo
//
//  Created by 许焕 on 2019/7/26.
//  Copyright © 2019 许焕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHTagsContainerViewModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, XHTagSelectedMode) {
    XHTagSelectedModeOneChoice = 0,//单选模式
    XHTagSelectedModeMoreChoice = 1,//多选模式
};

@protocol XHTagsContainerDelegate <NSObject>

/**标签点击*/
- (void)selectedTagWithIndex:(NSInteger)index;
/**更新标签状态回调*/
- (void)clearStateWithIndex:(NSInteger)index;
/**清除所有选中状态*/
- (void)clearAllSelectedState;

@end


@interface XHTagsContainer : UIView

- (instancetype)initWithViewModel:(XHTagsContainerViewModel *)viewModel;

@property (nonatomic, weak)id<XHTagsContainerDelegate> delegate;
/**默认是单选*/
@property (nonatomic, assign)XHTagSelectedMode selectedMode;
/**默认是可选*/
@property(nonatomic, assign)BOOL selectedEnabled;
/**设置标签背景颜色*/
@property (nonatomic, strong)UIColor *backgroundColor;
/**设置标签文字颜色*/
@property (nonatomic, strong)UIColor *textColor;
/**标签选中颜色*/
@property (nonatomic, strong)UIColor *selectedColor;
/**标签未选中颜色*/
@property (nonatomic, strong)UIColor *unSelectedColor;

/**清除所有标签选中*/
- (void)clearSelecteState;
/**主动调用开始绘制标签*/
- (void)drawTags;

@end

NS_ASSUME_NONNULL_END
