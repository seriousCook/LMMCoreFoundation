//
//  LMMViewController.m
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 02/20/2019.
//  Copyright (c) 2019 马敬龙. All rights reserved.
//

#import "LMMViewController.h"
#import "UIButton+LMM.h"
@interface LMMViewController ()

@property (nonatomic, strong) UIButton * testButton;

@end

@implementation LMMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.testButton = UIButton.LMM_BUTTON
    .lmm_font([UIFont systemFontOfSize:12.])
    .lmm_title(@"",UIControlStateNormal)
    .lmm_titleColor([UIColor redColor],UIControlStateNormal)
    .lmm_superView(self.view)
    .lmm_layoutMasonry(^(MASConstraintMaker *make){
        
    })
    .lmm_attributedtitle_1(@"",UIControlStateNormal, ^NSRange(NSMutableDictionary *dict){
        
        [dict setObject:@"" forKey:@""];
        return NSMakeRange(0, 0);
    });
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
