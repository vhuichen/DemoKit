//
//  ViewController.m
//  ModuleMain
//
//  Created by vchan on 2021/5/8.
//

#import "ViewController.h"
#import <ModuleFrameworkA/Student.h>
#import <ModuleFrameworkA/Teacher.h>
#import <ModuleFrameworkA/ModuleFrameworkA-Swift.h>
#import <ModuleFrameworkB/ModuleFrameworkB-Swift.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Student *stu = Student.new;
    Teacher *tea = Teacher.new;
    NSLog(@"vhuichen0");
    [stu whoIam];
    NSLog(@"vhuichen1");
    [tea whoIam];
    NSLog(@"vhuichen2");
    
    PersonSwift *aPersonSwift = PersonSwift.new;
//    [aPersonSwift sayHello];
    [aPersonSwift whoIam];
    ModuleBSwift *aModuleBSwift = ModuleBSwift.new;
    [aModuleBSwift moduleBSwiftSayHello];
    NSLog(@"vhuichen3");

}


@end
