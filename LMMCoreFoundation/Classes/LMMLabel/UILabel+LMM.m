//
//  UILabel+LMM.m
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 2019/3/9.
//

#import "UILabel+LMM.h"

@implementation UILabel (LMM)


+ (UILabel *)LMM_Label
{
    return [[UILabel alloc] init];
}

- (UILabel *(^)(NSString *))lmm_text
{
    return ^UILabel *(NSString * text) {
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(UIColor *))lmm_textColor
{
    return ^UILabel *(UIColor *textColor) {
        self.textColor = textColor;
        return self;
    };
}

- (UILabel *(^)(UIFont *))lmm_font
{
    return ^UILabel *(UIFont *font){
        self.font = font;
        return self;
    };
}
- (UILabel *(^)(NSTextAlignment))lmm_textAlignment
{
    return ^UILabel *(NSTextAlignment textAlignment) {
        self.textAlignment = textAlignment;
        return self;
    };
}
- (UILabel *(^)(NSAttributedString *))lmm_attributedText
{
    return ^UILabel *(NSAttributedString *attributedText) {
        self.attributedText = attributedText;
        return self;
    };
}
- (UILabel *(^)(NSInteger))lmm_numberOfLine
{
    return ^UILabel *(NSInteger numberOfLine) {
        [self setNumberOfLines:numberOfLine];
        return self;
    };
}

@end
