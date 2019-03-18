//
//  UIViewController+CYPNavigationbarIfHiden.m
//  Category
//
//  Created by 马敬龙 on 2018/12/4.
//  Copyright © 2018年 ma. All rights reserved.
//

#import "UIViewController+LMMNavigationbarHiden.h"



@implementation UIViewController (LMMNavigationbarHiden)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [self class];

        LMMReplaceMethod(cls, @selector(viewWillAppear:), @selector(lmm_NavigationBarTransition_viewWillAppear:));
    });
}

- (void)lmm_NavigationBarTransition_viewWillAppear:(BOOL)animated
{
    //调用navigationBar显示隐藏代理
    [self _lmm_renderNavigationBarInViewController:self WithAnimated:animated];
    //回调  viewWillAppear:  方法 ，可以在系统方法覆盖掉系统navigationBars设置
    [self lmm_NavigationBarTransition_viewWillAppear:animated];
}


#pragma mark- private
- (void)_lmm_renderNavigationBarInViewController:(UIViewController *)viewController WithAnimated:(BOOL)animated
{
    //是否是同一对象
    if (viewController != viewController.navigationController.topViewController) {
        return;
    }
    
    if ([viewController conformsToProtocol:@protocol(LMMCustomNavigationBarIdHidenDelegate)]) {
        UIViewController<LMMCustomNavigationBarIdHidenDelegate> *vc = (UIViewController<LMMCustomNavigationBarIdHidenDelegate>*)viewController;
        // 显示/隐藏 导航栏
        if ([vc _lmm_canCustomNavigationBarTransitionIfBarHiddenable]) {
            if ([vc _lmm_hideNavigationBarWhenTransitioning]) {
                if (!viewController.navigationController.isNavigationBarHidden) {
                    [viewController.navigationController setNavigationBarHidden:YES animated:animated];
                }
            } else {
                if (viewController.navigationController.isNavigationBarHidden) {
                    [viewController.navigationController setNavigationBarHidden:NO animated:animated];
                }
            }
        }
    }
}

- (BOOL)_lmm_canCustomNavigationBarTransitionIfBarHiddenable {
    if ([self _lmm_respondCustomNavigationBarTransitionIfBarHiddenable]) {
        UIViewController<LMMCustomNavigationBarIdHidenDelegate> *vc = (UIViewController<LMMCustomNavigationBarIdHidenDelegate> *)self;
        return [vc lmm_shouldCustomizeNavigationBarTransitionIfHideable];
    }
    return NO;
}

- (BOOL)_lmm_hideNavigationBarWhenTransitioning {
    if ([self _lmm_respondCustomNavigationBarTransitionWithBarHiddenState]) {
        UIViewController<LMMCustomNavigationBarIdHidenDelegate> *vc = (UIViewController<LMMCustomNavigationBarIdHidenDelegate> *)self;
        BOOL hidden = [vc lmm_preferredNavigationBarHidden];
        return hidden;
    }
    return NO;
}

- (BOOL)_lmm_respondCustomNavigationBarTransitionIfBarHiddenable {
    BOOL respondIfBarHiddenable = NO;
    if ([self conformsToProtocol:@protocol(LMMCustomNavigationBarIdHidenDelegate)]) {
        UIViewController<LMMCustomNavigationBarIdHidenDelegate> *vc = (UIViewController<LMMCustomNavigationBarIdHidenDelegate> *)self;
        if ([vc respondsToSelector:@selector(lmm_shouldCustomizeNavigationBarTransitionIfHideable)]) {
            respondIfBarHiddenable = YES;
        }
    }
    return respondIfBarHiddenable;
}

- (BOOL)_lmm_respondCustomNavigationBarTransitionWithBarHiddenState {
    BOOL respondWithBarHidden = NO;
    if ([self conformsToProtocol:@protocol(LMMCustomNavigationBarIdHidenDelegate)]) {
        UIViewController<LMMCustomNavigationBarIdHidenDelegate> *vc = (UIViewController<LMMCustomNavigationBarIdHidenDelegate> *)self;
        if ([vc respondsToSelector:@selector(lmm_preferredNavigationBarHidden)]) {
            respondWithBarHidden = YES;
        }
    }
    return respondWithBarHidden;
}



@end
