//
//  ModuleBOC.m
//  ModuleFrameworkB
//
//  Created by vchan on 2021/5/10.
//

#import "ModuleBOC.h"
#import <ModuleFrameworkA/ModuleFrameworkA.h>

@implementation ModuleBOC

- (void)sayHello {
    Student *stu = Student.new;
    
    [stu whoIam];
}

@end
