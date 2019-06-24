//
//  LMMCourseViewController.m
//  LMMCoreFoundation_Example
//
//  Created by 马敬龙 on 2019/6/24.
//  Copyright © 2019年 马敬龙. All rights reserved.
//

#import "LMMCourseViewController.h"
#import "NSObject+LMMBundle.h"
#import "NSObject+LMMFileManager.h"
@interface LMMCourseViewController ()<NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    NSInteger tag;
    NSInteger subTag;
}
@property (nonatomic, strong) NSURLConnection * connect;
@property (nonatomic, strong) NSMutableData * data;
@property (nonatomic, strong) NSArray * dataArray;
@property (nonatomic, strong) NSArray * subItems;
@property (nonatomic, strong) NSString * currPath;
@property (nonatomic, copy) NSString * currImageName;
@end

@implementation LMMCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataArray = [self lmm_readBundleJsonFileWithName:@"标志"];
    
    
    [self start:0];
}

- (void)start:(NSInteger)index
{
    if (tag >= self.dataArray.count) {
        [[[UIAlertView alloc] initWithTitle:@"下载完毕" message:@"" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
        return;
    }
    NSDictionary * dic = self.dataArray[index];
    self.subItems = dic[@"content"];
    
    self.currPath = [self lmm_DoumentWithSubpath:dic[@"name"]];
    NSLog(@"filePath__%@",self.currPath);
    subTag = 0;
    [self itemStart:0];
}

- (void)itemStart:(NSInteger)index
{
    if (subTag >= self.subItems.count) {
        tag++;
        [self start:tag];
        return;
    }
    subTag = index;
    NSDictionary * dic = self.subItems[index];
    self.currImageName = dic[@"name"];
    [self requestWithId:dic[@"imageUrl"]];
}

- (void)requestWithId:(NSString *)_id
{
   
    
    self.data = [[NSMutableData alloc] init];
    
//    NSString * urlStr = [[NSString alloc] initWithFormat:@"http://mnks.jxedt.com/get_question?r=0.10163243037552194&index=%@",@(_id)];
    NSURL * url = [NSURL URLWithString:_id];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    self.connect = [NSURLConnection connectionWithRequest:request delegate:self];
    
    [self.connect start];
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error>>>>>>>>>>>>>>>%@",error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIImage * image = [UIImage imageWithData:self.data];
        
        NSDictionary * dic = self.subItems[subTag];
        NSString *url = dic[@"imageUrl"];
        NSString * prefix = @".jpg";
        if ([url hasSuffix:@".gif"]) {
            prefix = @".gif";
        }
        
        NSString * filePath = [self.currPath stringByAppendingPathComponent:[self.currImageName stringByAppendingString:prefix]];
        
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:filePath atomically:YES];
        
//        BOOL result = [self lmm_writeFile:image filePath:filePath];
        //    if (result) {
//        NSLog(@"filePath__%@",filePath);
        //    }
        ++subTag;
        [self itemStart:subTag];
    });
    
}


@end
