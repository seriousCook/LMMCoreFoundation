//
//  UIButton+LMM.m
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 2019/2/20.
//

#import "UIButton+LMM.h"

@implementation UIButton (LMM)


+ (UIButton *)LMM_BUTTON
{
    return [[UIButton alloc] init];
    
}

- (UIButton *(^)(CGRect))lmm_frame
{
    return ^UIButton *(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIButton *(^)(UIFont *))lmm_font
{
    return ^UIButton *(UIFont *font){
        self.titleLabel.font =font;
        return self;
    };
}

- (UIButton *(^)(UIColor *))lmm_backgroundColor
{
    return ^UIButton *(UIColor *bgColor){
        [self setBackgroundColor:bgColor];
        return self;
    };
}

- (UIButton *(^)(NSString *, UIControlState))lmm_title
{
    return ^UIButton *(NSString *title, UIControlState state){
        [self setTitle:title forState:state];
        return self;
    };
}

- (UIButton *(^)(UIColor *, UIControlState))lmm_titleColor
{
    return ^UIButton *(UIColor *color, UIControlState state){
        [self setTitleColor:color forState:state];
        return self;
    };
}

- (UIButton *(^)(NSAttributedString *, UIControlState))lmm_attributedTitle
{
    return ^UIButton *(NSAttributedString *attStr, UIControlState state){
        [self setAttributedTitle:attStr forState:state];
        return self;
    };
}

- (UIButton *(^)(UIImage *, UIControlState))lmm_image
{
    return ^UIButton *(UIImage *image, UIControlState state){
        
        return self;
    };
}

- (UIButton *(^)(UIImage *, UIControlState))lmm_backgroundImage
{
    return ^UIButton *(UIImage *image, UIControlState state){
        [self setBackgroundImage:image forState:state];
        return self;
    };
}

- (UIButton *(^)(id, SEL))lmm_method
{
    return ^UIButton *(id target, SEL selector){
        [self addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}

- (UIButton *(^)(UIView *))lmm_superView
{
    return ^UIButton *(UIView * superView){
        [superView addSubview:self];
        return self;
    };
}


- (UIButton *(^)(LMM_MasMakeBlock))lmm_layoutMasonry
{
    //    return ^UIButton *(void(^make)(MASConstraintMaker *)){
    return ^UIButton *(LMM_MasMakeBlock make){
        [self mas_makeConstraints:make];
        return self;
    };
}


- (UIButton *(^)(NSString *, UIControlState, LMM_AttriMakeBlock))lmm_attributedtitle_1
{
    return ^UIButton *(NSString *title, UIControlState state, LMM_AttriMakeBlock attriMake){
        NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:title];
        NSMutableDictionary * attriDict = [NSMutableDictionary dictionary];
        NSRange range = attriMake(attriDict);
        //避免设置范围超过文本长度
        if (range.length+range.location > title.length) {
            range.length = title.length-range.location;
        }
        [attriStr addAttributes:attriDict range:range];
        return self;
    };
}


@end
