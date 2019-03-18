//
//  CYPCustomNavigationBarTransitionProtocol.h
//  Category
//
//  Created by 马敬龙 on 2018/12/4.
//  Copyright © 2018年 ma. All rights reserved.
//

#ifndef LMMCustomNavigationBarTransitionProtocol_h
#define LMMCustomNavigationBarTransitionProtocol_h


@protocol LMMCustomNavigationBarIdHidenDelegate <NSObject>

/// 设置每个界面导航栏的显示/隐藏，为了减少对项目的侵入性，默认不开启这个接口的功能，只有当 shouldCustomizeNavigationBarTransitionIfHideable 返回 YES 时才会开启此功能。如果需要全局开启，那么就在 Controller 基类里面返回 YES；如果是老项目并不想全局使用此功能，那么则可以在单独的界面里面开启。
- (BOOL)lmm_preferredNavigationBarHidden;

/**
 *  当切换界面时，如果不同界面导航栏的显示状态不同，可以通过 shouldCustomizeNavigationBarTransitionIfHideable 设置是否需要接管导航栏的显示和隐藏。从而不需要在各自的界面的 viewWillappear 和 viewWillDisappear 里面去管理导航栏的状态。
 *  @see preferredNavigationBarHidden
 */
- (BOOL)lmm_shouldCustomizeNavigationBarTransitionIfHideable;

@end




#endif /* CYPCustomNavigationBarTransitionProtocol_h */
