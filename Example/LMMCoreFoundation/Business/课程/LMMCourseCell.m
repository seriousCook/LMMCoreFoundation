//
//  LMMCourseCell.m
//  LMMCoreFoundation_Example
//
//  Created by 马敬龙 on 2019/2/24.
//  Copyright © 2019年 马敬龙. All rights reserved.
//

#import "LMMCourseCell.h"
#import "UIColor+LMM.h"
#import "NSString+LMMAttribute.h"
#import "Masonry.h"
@interface LMMCourseCell()

@property (nonatomic, strong) UIImageView * courseImageView;
@property (nonatomic, strong) UILabel * courseLabel;
@property (nonatomic, strong) UILabel * teacherLabel;
@property (nonatomic, strong) UILabel * gzLabel;
@property (nonatomic, strong) UILabel * beginLabel;
@property (nonatomic, strong) UILabel * priceLabel;


@end

@implementation LMMCourseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.courseImageView = [[UIImageView alloc] init];
        self.courseImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.courseImageView.backgroundColor = [UIColor lmm_colorWithHex:@"#cccccc"];
        [self.contentView addSubview:self.courseImageView];
        [self.courseImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.top.equalTo(@10);
            make.width.equalTo(@100);
            make.height.equalTo(@70);
        }];
        
        self.courseLabel = [[UILabel alloc] init];
        self.courseLabel.textColor = [UIColor blackColor];
        self.courseLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.courseLabel];
        [self.courseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.courseImageView.mas_right).offset(8);
            make.top.equalTo(@9);
            make.right.equalTo(@(-10));
        }];
        
        self.teacherLabel = [[UILabel alloc] init];
        self.teacherLabel.textColor = [UIColor orangeColor];
        self.teacherLabel.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:self.teacherLabel];
        [self.teacherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.courseImageView.mas_right).offset(8);
            make.top.equalTo(self.courseLabel.mas_bottom).offset(4);
        }];
        
        self.beginLabel = [[UILabel alloc] init];
        self.beginLabel.textColor = [UIColor orangeColor];
        self.beginLabel.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:self.beginLabel];
        [self.beginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.courseImageView.mas_right).offset(8);
            make.top.equalTo(self.teacherLabel.mas_bottom).offset(4);
        }];
        
        self.priceLabel = [[UILabel alloc] init];
        self.priceLabel.textColor = [UIColor blackColor];
        self.priceLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.priceLabel];
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.courseImageView.mas_right).offset(8);
            make.bottom.equalTo(@(-10));
        }];
    }
    return self;
}

- (void)setModel:(LMMCourseModel *)model
{
    if (_model != model) {
        
        self.courseLabel.text = model.courseName;
        self.teacherLabel.text = [[NSString alloc] initWithFormat:@"%@:%@",model.teacerLevel,model.teacherName];
        
        NSString * price = [[NSString alloc] initWithFormat:@"¥%@  ¥%@",model.currentPrice,model.sourcePrice];
        self.priceLabel.attributedText = [price lmm_setThroughLine:[@"¥" stringByAppendingFormat:@"%@",model.sourcePrice] otherAttrs:^NSDictionary * _Nonnull{
            return @{NSFontAttributeName : [UIFont systemFontOfSize:11],
                     NSForegroundColorAttributeName : [UIColor lightGrayColor]
                     };
        }];
    }
}

@end
