//
//  VCHUnusedClassCheck.h
//  PodLibInit_Example
//
//  Created by vchan on 2021/4/14.
//  Copyright © 2021 vhuichen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VCHUnusedClassCheck : NSObject

/// 此方法只能调用一次，第二次调用返回空
+ (NSArray<NSString *> *)getUnusedClass;

@end

NS_ASSUME_NONNULL_END
