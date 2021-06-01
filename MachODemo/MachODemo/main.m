//
//  main.m
//  MachODemo
//
//  Created by vchan on 2021/5/31.
//

//#import <UIKit/UIKit.h>
//#import "AppDelegate.h"
//
//int main(int argc, char * argv[]) {
//    NSString * appDelegateClassName;
//    @autoreleasepool {
//        // Setup code that might create autoreleased objects goes here.
//        appDelegateClassName = NSStringFromClass([AppDelegate class]);
//    }
//    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
//}

//#import <stdio.h>
//int main(int argc, char * argv[]) {
//    static int iii = 0;
//    static int jjj = 1;
//
//    printf("%d + %d",iii, jjj);
//    return 0;
//}

extern int global_var;

void func(int a);

int main() {
    int a = 100;
    func(a + global_var);
    return 0;
}
