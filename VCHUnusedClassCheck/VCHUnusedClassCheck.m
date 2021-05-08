//
//  VCHUnusedClassCheck.m
//  PodLibInit_Example
//
//  Created by vchan on 2021/4/14.
//  Copyright © 2021 vhuichen. All rights reserved.
//

#import "VCHUnusedClassCheck.h"
#include <dlfcn.h>
#include <mach-o/dyld.h>
#include <mach-o/getsect.h>

@implementation VCHUnusedClassCheck

/*
+ (void)load {
    [NSTimer scheduledTimerWithTimeInterval:5 repeats:NO block:^(NSTimer * _Nonnull timer) {
        NSLog(@"%@", [self getUnusedClass]);
    }];
}
*/

+ (NSArray<NSString *> *)getUnusedClass {
    NSMutableSet<NSString *> *_runtimeUnusedClass = runtimeUnusedClass();
    NSMutableSet<NSString *> *_machOUnusedClass = machOUnusedClass();
    
    [_runtimeUnusedClass  intersectSet:_machOUnusedClass];
    
    return _runtimeUnusedClass.allObjects;
}


/* 获取 runtime 未使用的类 */
NSMutableSet<NSString *> *runtimeUnusedClass() {
    Dl_info info;
    dladdr((const void *)&runtimeUnusedClass, &info);
    
    const uint64_t mach_header = (uint64_t)info.dli_fbase;
    
    const struct section_64 *classlist = getsectbynamefromheader_64((const struct mach_header_64 *)mach_header, "__DATA", "__objc_classlist");
    
    if (classlist) {
        NSMutableSet *classlistUnused = [[NSMutableSet alloc] init];
        // 遍历拿到所有的类
        for (UInt64 addr = classlist->offset; addr < classlist->offset + classlist->size; addr += sizeof(const char **)) {
            uint64_t baseArrr = mach_header + addr;
            
            //获取类对象指针
            uint64_t object_class_addr = *(uint64_t *)(baseArrr);
            //
            uint64_t object_class_isa = *(uint64_t *)(object_class_addr);
            //获取元类对象
            uint64_t object_meta_class_addr;
            if (object_class_isa & (1 << 0)) {
                object_meta_class_addr = object_class_addr;
            } else {
                object_meta_class_addr = object_class_isa & 0x00007ffffffffff8ULL;
            }
            //偏移32个字节，拿到 class_data_bits 的地址
            uint64_t class_data_bits_addr = object_meta_class_addr + 32;
            //取 class_data_bits 的值
            uint64_t class_data_bits = *(uint64_t *)(class_data_bits_addr);
            //得到 class_rw_t 的指针 (class_rw_t *)(bits & FAST_DATA_MASK);
            uint64_t class_rw_addr = (class_data_bits & 0x00007ffffffffff8UL);
            //取指针的值，得到的第一个数据就是 flags
            uint64_t flags = *(uint64_t *)(class_rw_addr);
            //
            bool isInitialized = flags & (1 << 29);
            
            if (!isInitialized) {
                //打印类会导致类初始化，所以此方法只能使用一次
                NSString *class = [NSString stringWithFormat:@"%@", (void *)object_class_addr];
                [classlistUnused addObject:class];
            }
        }
        return classlistUnused;
    }
    return nil;
}

/* 获取 MachO 未使用的类 */
NSMutableSet<NSString *> *machOUnusedClass() {
    Dl_info info;
    dladdr((const void *)&machOUnusedClass, &info);
    
    const uint64_t mach_header = (uint64_t)info.dli_fbase;
    
    const struct section_64 *classlist = getsectbynamefromheader_64((const struct mach_header_64 *)mach_header, "__DATA", "__objc_classlist");
    const struct section_64 *selfrefs = getsectbynamefromheader_64((const struct mach_header_64 *)mach_header, "__DATA", "__objc_classrefs");
    
    if (classlist && selfrefs) {
        NSMutableSet *classlistSet = [[NSMutableSet alloc] init];
        for (UInt64 addr = classlist->offset; addr < classlist->offset + classlist->size; addr += sizeof(const char **)) {
            uint64_t baseArrr = mach_header + addr;
            Class cls = (__bridge Class)(*(void **)(baseArrr));
            NSString *clsString = [NSString stringWithFormat:@"%@",cls];
            [classlistSet addObject:clsString];
        }
        
        NSMutableSet *selfrefsSet = [[NSMutableSet alloc] init];
        for (UInt64 addr = selfrefs->offset; addr < selfrefs->offset + selfrefs->size; addr += sizeof(const char **)) {
            uint64_t baseArrr = mach_header + addr;
            
            Class cls = (__bridge Class)(*(void **)(baseArrr));
            while (cls) {
                [selfrefsSet addObject:[NSString stringWithFormat:@"%@",cls]];
                cls = [cls superclass];
            }
        }
        [classlistSet minusSet:selfrefsSet];
        
        return  classlistSet;
    }
    
    return nil;
}

@end
