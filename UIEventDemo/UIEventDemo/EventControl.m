//
//  EventControl.m
//  UIEventDemo
//
//  Created by vchan on 2021/6/17.
//

#import "EventControl.h"



@implementation EventControl

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    [self addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer)];
    
    tap.cancelsTouchesInView = YES;
    tap.delaysTouchesBegan = NO;
    tap.delaysTouchesEnded = YES;
    [self addGestureRecognizer:tap];
    
}

- (void)buttonClick {
    NSLog(@"buttonClick");
}

- (void)tapGestureRecognizer {
    NSLog(@"tapGestureRecognizer");
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"touchesBegan");
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"touchesEnded");
//}
//
//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"touchesCancelled");
//}

@end
