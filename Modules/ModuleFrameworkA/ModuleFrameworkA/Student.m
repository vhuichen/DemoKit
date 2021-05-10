//
//  Student.m
//  ModuleFrameworkA
//
//  Created by vchan on 2021/5/8.
//

#import "Student.h"
#import <ModuleFrameworkA/ModuleFrameworkA-Swift.h>

@implementation Student

- (void)whoIam {
    NSLog(@"I am Student");
    
    PersonSwift *ps = [[PersonSwift alloc] init];
//    [ps sayHello];
    ps.age = 10;
    [ps whoIam];
    
    ModuleSwiftA1 *aModuleSwiftA1 = ModuleSwiftA1.new;
    
}

@end
