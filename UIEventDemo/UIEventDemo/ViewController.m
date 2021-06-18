//
//  ViewController.m
//  UIEventDemo
//
//  Created by vchan on 2021/6/17.
//

#import "ViewController.h"
#import "EventControl.h"
#import "EventUIButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer)];
    [self.view addGestureRecognizer:tap];
    
    EventControl *ec = [[EventControl alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    ec.backgroundColor = UIColor.redColor;
    [self.view addSubview:ec];
    
    UIButton *buton = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 50, 50)];
    [buton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    buton.backgroundColor = UIColor.redColor;
    [self.view addSubview:buton];
    
    EventUIButton *aEventUIButton = [[EventUIButton alloc] initWithFrame:CGRectMake(100, 300, 50, 50)];
    [aEventUIButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    aEventUIButton.backgroundColor = UIColor.redColor;
    [self.view addSubview:aEventUIButton];
}

- (void)buttonClick {
    NSLog(@"ViewController buttonClick");
}


- (void)tapGestureRecognizer {
    NSLog(@"super tapGestureRecognizer");
}

@end
