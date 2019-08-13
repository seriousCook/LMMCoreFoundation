//
//  LMMWebView.m
//  LMMCoreFoundation
//
//  Created by 马敬龙 on 2019/8/11.
//

#import "LMMWebView.h"
#import <WebKit/WebKit.h>
#import "LMMWKWebView.h"

@interface LMMWebView ()<WKNavigationDelegate,WKUIDelegate, WKScriptMessageHandler>

@property (nonatomic, strong) LMMWKWebView * wkWebView;


@end

@implementation LMMWebView


#pragma mark --------------WKWebViewDelegate-------------
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSURL *URL = navigationAction.request.URL;
    NSString *scheme = [URL scheme];
   
    if ([scheme isEqualToString:@"tel"]) { //打电话
        NSString *resourceSpecifier = [URL resourceSpecifier];
        NSString *callPhone = [NSString stringWithFormat:@"telprompt://%@", resourceSpecifier];
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone]];
        });
        decisionHandler(WKNavigationActionPolicyCancel);
        return ;
    }
    //跳转外部APP
    NSArray *allowSchemes = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"LSApplicationQueriesSchemes"]?:@[];
    if ([allowSchemes containsObject:scheme]) {
        if ([[UIApplication sharedApplication] canOpenURL:URL]) {
            [[UIApplication sharedApplication] openURL:URL];
            decisionHandler(WKNavigationActionPolicyCancel);
            return ;
        }
    }
    //
    
    
    BOOL should = YES;
//    should = [MistaJockey webView:self withUrl:navigationAction.request.URL];
//    if (should) {
//        if ([self.delegate respondsToSelector:@selector(mista_webView:shouldStartLoadWithRequest:)]) {
//            should = [self.delegate mista_webView:self shouldStartLoadWithRequest:navigationAction.request];
//        }
//    }
    
    
    if (should) {
        decisionHandler(WKNavigationActionPolicyAllow);
    }else{
        decisionHandler(WKNavigationActionPolicyCancel);
    }
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    NSLog(@"Mista-WKWebView response %@",navigationResponse.response.URL);
    decisionHandler(WKNavigationResponsePolicyAllow);
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
//    NSLog(@"Mista-WKWebView should start load %@", webView.URL);
//    if ([self.delegate respondsToSelector:@selector(mista_webViewDidStartLoad:)]) {
//        [self.delegate mista_webViewDidStartLoad:self];
//    }
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"Mista-WKWebView did commit naviagtion %@", webView.URL);
    
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
//    NSLog(@"Mista-WKWebView fail Navigation %@", webView.URL);
//    if ([self.delegate respondsToSelector:@selector(mista_webView:didFailLoadWithError:)]) {
//        [self.delegate mista_webView:self didFailLoadWithError:error];
//    }
//
//    if([self.delegate respondsToSelector:@selector(mista_webView:loadProgress:)]){
//        [self.delegate mista_webView:self loadProgress:1.0];
//    }
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"Mista-WKWebView fail ProvisionalNavigation %@", webView.URL);
//    if ([self.delegate respondsToSelector:@selector(mista_webView:didFailLoadWithError:)]) {
//        [self.delegate mista_webView:self didFailLoadWithError:error];
//    }
//
//    if([self.delegate respondsToSelector:@selector(mista_webView:loadProgress:)]){
//        [self.delegate mista_webView:self loadProgress:1.0];
//    }
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"Mista-WKWebView finish load %@",webView.URL);
//    if ([self.delegate respondsToSelector:@selector(mista_webViewDidFinishLoad:)]) {
//        [self.delegate mista_webViewDidFinishLoad:self];
//    }
//    if([self.delegate respondsToSelector:@selector(mista_webView:loadProgress:)]){
//        [self.delegate mista_webView:self loadProgress:1.0];
//    }
}

- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    NSLog(@"config");
    if (navigationAction.request.URL) {
        
        NSURL *url = navigationAction.request.URL;
        NSString *urlPath = url.absoluteString;
        if ([urlPath rangeOfString:@"https://"].location != NSNotFound || [urlPath rangeOfString:@"http://"].location != NSNotFound) {
            [webView loadRequest:[NSURLRequest requestWithURL:url]];
        }
        NSString *scheme = [url scheme];
        NSArray *allowSchemes = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"LSApplicationQueriesSchemes"]?:@[];
        if ([allowSchemes containsObject:scheme]) {
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url];
            }
        }
        
    }
    return nil;
    
}

#pragma mark --------------------lazy--------------------
- (LMMWKWebView *)wkwebView{
    if (!_wkWebView) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        _wkWebView = [[LMMWKWebView alloc]initWithFrame:CGRectZero configuration:config];
        _wkWebView.navigationDelegate = self;
        _wkWebView.UIDelegate = self;
    }
    return _wkWebView;
}


@end
