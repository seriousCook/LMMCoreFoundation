//
//  UIButton+LMM.h
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 2019/2/20.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Masonry.h"
NS_ASSUME_NONNULL_BEGIN
/*
    为UIButton添加链式set方法
 */
typedef void(^LMM_MasMakeBlock)(MASConstraintMaker *);
typedef NSRange (^LMM_AttriMakeBlock)(NSMutableDictionary*);

@interface UIButton (LMM)


+ (UIButton *)LMM_BUTTON;

- (UIButton *(^)(CGRect))lmm_frame;
- (UIButton *(^)(UIFont *))lmm_font;
- (UIButton *(^)(UIColor *))lmm_backgroundColor;
- (UIButton *(^)(NSString *, UIControlState))lmm_title;
- (UIButton *(^)(UIColor *, UIControlState))lmm_titleColor;
- (UIButton *(^)(NSAttributedString *, UIControlState))lmm_attributedTitle;
- (UIButton *(^)(UIImage *, UIControlState))lmm_image;
- (UIButton *(^)(UIImage *, UIControlState))lmm_backgroundImage;
- (UIButton *(^)(id, SEL))lmm_method;
- (UIButton *(^)(UIView *))lmm_superView;

//调用此方法，必须先调用lmm_superView
- (UIButton *(^)(LMM_MasMakeBlock))lmm_layoutMasonry;

- (UIButton *(^)(NSString *, UIControlState, LMM_AttriMakeBlock))lmm_attributedtitle_1;




@end

NS_ASSUME_NONNULL_END
