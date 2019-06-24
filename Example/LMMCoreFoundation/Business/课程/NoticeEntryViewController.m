//
//  NoticeEntryViewController.m
//  Motorcycle
//
//  Created by 韩敬 on 2019/6/21.
//  Copyright © 2019 YCKJ. All rights reserved.
//

#import "NoticeEntryViewController.h"
#import "ReadJson.h"
#import "Masonry.h"
@interface NoticeEntryViewController ()

@end

@implementation NoticeEntryViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"报名须知";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    NSDictionary * noticeDic = [ReadJson readLocalFileWithName:@"报名须知"];
    UIScrollView * bgScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(10, 0, CGRectGetWidth(self.view.frame) - 20, CGRectGetHeight(self.view.frame) - 20-44)];
    bgScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:bgScrollView];
    bgScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame)-20, CGRectGetHeight(self.view.frame) * 3);
    UILabel * tipLabel = [[UILabel alloc]init];
    [bgScrollView addSubview:tipLabel];

    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgScrollView.mas_top).offset((10));
        make.left.equalTo(bgScrollView.mas_left).offset((0));
        make.width.equalTo(bgScrollView.mas_width);
//        make.right.equalTo(bgScrollView.mas_right).offset(-(20));
    }];
  
    tipLabel.text = [noticeDic objectForKey:@"notice"];
    tipLabel.textColor = [UIColor blackColor];
    tipLabel.numberOfLines = 0;
    tipLabel.font = [UIFont systemFontOfSize:14];

}


@end
