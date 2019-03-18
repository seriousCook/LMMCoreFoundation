//
//  UILabel+LMM.h
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 2019/3/9.
//



NS_ASSUME_NONNULL_BEGIN

@interface UILabel (LMM)

+ (UILabel *)LMM_Label;

- (UILabel *(^)(UIColor *))lmm_textColor;
- (UILabel *(^)(NSString *))lmm_text;
- (UILabel *(^)(UIFont *))lmm_font;
- (UILabel *(^)(NSTextAlignment))lmm_textAlignment;
- (UILabel *(^)(NSAttributedString *))lmm_attributedText;
- (UILabel *(^)(NSInteger))lmm_numberOfLine;



@end

NS_ASSUME_NONNULL_END
