//
//  CYPCommonMethod.h
//  Category
//
//  Created by 马敬龙 on 2018/12/4.
//  Copyright © 2018年 ma. All rights reserved.
//

#ifndef LMMCommonMethod_h
#define LMMCommonMethod_h

#import <objc/runtime.h>


BOOL LMMReplaceMethod(Class _class, SEL _originSelector, SEL _newSelector) {
    Method oriMethod = class_getInstanceMethod(_class, _originSelector);
    Method newMethod = class_getInstanceMethod(_class, _newSelector);
    if (!newMethod) {
        // class 里不存在该方法的实现
        return NO;
    }
    BOOL isAddedMethod = class_addMethod(_class, _originSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (isAddedMethod) {
        class_replaceMethod(_class, _newSelector, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
    } else {
        method_exchangeImplementations(oriMethod, newMethod);
    }
    return YES;
}


#endif /* CYPCommonMethod_h */
