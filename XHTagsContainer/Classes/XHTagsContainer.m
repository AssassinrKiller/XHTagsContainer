//
//  XHTagsContainer.m
//  StudyDemo
//
//  Created by 许焕 on 2019/7/26.
//  Copyright © 2019 许焕. All rights reserved.
//

#import "XHTagsContainer.h"
#import "NSBundle+XH.h"

@interface XHTagsContainer()

@property (nonatomic, strong)XHTagsContainerViewModel *viewModel;
@property (nonatomic, strong)NSMutableArray *tagBtns;
@property (nonatomic, copy)NSArray *buildArr;
@property (nonatomic, strong)UIButton *lastTagBtn;
@property (nonatomic, assign)CGFloat fontSize;

@end

@implementation XHTagsContainer

- (instancetype)initWithViewModel:(XHTagsContainerViewModel *)viewModel{
    if (self = [super init]) {
        
        NSBundle *b = [NSBundle xh_bundle];
        NSString *title = NSLocalizedStringFromTableInBundle(@"草莓", @"XHTagsContainer", b, nil);
        UIImage *image = [UIImage imageNamed:@"netError_img" inBundle:b compatibleWithTraitCollection:nil];
    
        NSLog(@"xuhuan --- title:%@ ---- image:%@",title,image);
        
        self.viewModel = viewModel;
        self.buildArr = viewModel.tagFrames.copy;
        [self configDefault];
    }
    return self;
}

- (void)configDefault{
    self.tagBtns = [NSMutableArray array];
    self.fontSize = self.viewModel.fontSize;
    self.backgroundColor = [UIColor whiteColor];
    self.textColor = [UIColor grayColor];
    self.selectedColor = [UIColor blackColor];
    self.unSelectedColor = [UIColor grayColor];
}

- (void)setSelectedEnabled:(BOOL)selectedEnabled{
    self.userInteractionEnabled = selectedEnabled;
}

- (void)drawTags{
    if (!self.buildArr.count) return;
    NSInteger i = 0;
    [self.tagBtns removeAllObjects];
    for (NSDictionary *dic in self.buildArr) {
        id model = dic[kTagModel];
        CGRect rect = [dic[kTagRect] CGRectValue];
        UIButton *btn = [self tagBtnWithTitle:nil];
        btn.tag = i;
        NSString *value;
        BOOL defaultSelected = NO;
        if ([model isKindOfClass:NSString.class]){
            value = model;
        }
        btn.frame = rect;
        [btn setTitle:value forState:0];
        btn.selected = defaultSelected;
        [self autoChangeBorderColor:btn];
        if (defaultSelected && self.selectedMode == XHTagSelectedModeOneChoice) {
            self.lastTagBtn = btn;//单选模式记录
        }
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self.tagBtns addObject:btn];
        i++;
    }
}

//清除所有选中状态
- (void)clearSelecteState{
    for (UIButton *btn in self.tagBtns) {
        btn.selected = NO;
        [self autoChangeBorderColor:btn];
        if ([self.delegate respondsToSelector:@selector(clearAllSelectedState)]) {
            [self.delegate clearAllSelectedState];
        }
    }
}

- (void)setLastTagBtn:(UIButton *)lastTagBtn{
    if (_lastTagBtn != lastTagBtn) {
        if (_lastTagBtn) {
            _lastTagBtn.selected = NO;//按钮状态改变
            [self autoChangeBorderColor:_lastTagBtn];
            if ([self.delegate respondsToSelector:@selector(clearStateWithIndex:)]) {
                [self.delegate clearStateWithIndex:_lastTagBtn.tag];
            }
        }
        _lastTagBtn = lastTagBtn;
    }
}

- (void)autoChangeBorderColor:(UIButton *)btn{
    if (btn.selected) {
        btn.layer.borderColor = self.selectedColor.CGColor;
    }else{
        btn.layer.borderColor = self.unSelectedColor.CGColor;
    }
}

- (void)btnClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    [self autoChangeBorderColor:btn];
    if (self.selectedMode == XHTagSelectedModeOneChoice) {
        self.lastTagBtn = btn;
    }
    if ([self.delegate respondsToSelector:@selector(selectedTagWithIndex:)]) {
        [self.delegate selectedTagWithIndex:btn.tag];
    }
}

- (UIButton *)tagBtnWithTitle:(NSString *)title{
    UIButton *btn = [UIButton buttonWithType:0];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:self.fontSize]];
    [btn setTitle:title forState:0];
    [btn setTitleColor:self.textColor forState:UIControlStateNormal];
    [btn setTitleColor:self.selectedColor forState:UIControlStateSelected];
    btn.layer.borderColor = self.unSelectedColor.CGColor;
    [btn setBackgroundColor:self.backgroundColor];
    btn.layer.borderWidth = 1;
    btn.layer.cornerRadius = 4;
    return btn;
}


@end
