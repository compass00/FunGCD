//
//  ViewController.m
//  FunGCD
//
//  Created by JiaLi on 16/5/28.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title= self.nvtitle;
    // Do any additional setup after loading the view, typically from a nib.
    self.mainthreadState.text = [[NSThread currentThread] description];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    switch (self.type) {
        case 0:
            // @"Main Thread && async";
            [self mainThread_async];
            break;
        case 1:
            // @"Main Thread && sync";
            [self mainThread_sync];
            break;
        case 2:
            // @"Create Thread && async";
            [self createThread_async];

            break;
        case 3:
            // @"Create Thread && sync";
            [self createThread_sync];
           break;
        case 4:
            // @"globle Thread && async";
            [self globleThread_async];
           
            break;
        case 5:
            // @"globle Thread && sync";
            [self globleThread_sync];

            break;
            
        default:
            break;
    }

    switch (self.type) {
        case 0:
            break;
            
        default:
            break;
    }
}


- (void)mainThread_async {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t quene = dispatch_get_main_queue();
    __block NSString* s = [NSString stringWithFormat:@""];
    for (int i = 0; i < 5; i++) {
        dispatch_group_async(group, quene, ^(void) {
            NSLog(@"%@", [NSThread currentThread]);
            s = [NSString stringWithFormat:@"%@\n%@", s, [NSThread currentThread]];
      });
    }

    dispatch_group_notify(group, quene, ^ {
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            self.threadState.text = s;
        });
    });
}

- (void)mainThread_sync {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t quene = dispatch_get_main_queue();
    for (int i = 0; i < 5; i++) {
        dispatch_sync(quene, ^(void) {
            NSLog(@"%@", [NSThread currentThread]);
           self.threadState.text = [NSString stringWithFormat:@"%@\n%@", self.threadState.text, [NSThread currentThread]];
        });
    }
    
}

- (void)createThread_async {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t quene = dispatch_queue_create("com.topalpha.funGCD", DISPATCH_QUEUE_CONCURRENT);
    __block NSString* s = [NSString stringWithFormat:@""];
   for (int i = 0; i < 5; i++) {
        dispatch_group_async(group, quene, ^(void) {
            NSLog(@"%@", [NSThread currentThread]);
            sleep(i);
            s = [NSString stringWithFormat:@"%@\n%@", s, [NSThread currentThread]];
        });
    }
    dispatch_group_notify(group, quene, ^ {
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            self.threadState.text = s;
        });
    });
    
    s = [NSString stringWithFormat:@"%@\n%@", s, @"DISPATCH_QUEUE_SERIAL"];

    group = dispatch_group_create();
    quene = dispatch_queue_create("com.topalpha.funGCD", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 5; i++) {
        dispatch_group_async(group, quene, ^(void) {
            NSLog(@"%@", [NSThread currentThread]);
            s = [NSString stringWithFormat:@"%@\n%@", s, [NSThread currentThread]];
        });
    }
    dispatch_group_notify(group, quene, ^ {
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            self.threadState.text = s;
        });
    });
}

- (void)createThread_sync {
    __block NSString* s = [NSString stringWithFormat:@""];
    dispatch_queue_t quene = dispatch_queue_create("com.topalpha.funGCD", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 5; i++) {
        dispatch_sync(quene, ^(void) {
            NSLog(@"%@", [NSThread currentThread]);
            s = [NSString stringWithFormat:@"%@\n%@", s, [NSThread currentThread]];
        });
    }
    self.threadState.text = s;
}

- (void)globleThread_async {
    dispatch_group_t group = dispatch_group_create();
   dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    __block NSString* s = [NSString stringWithFormat:@""];
    for (int i = 0; i < 5; i++) {
        dispatch_group_async(group, quene, ^(void) {
            NSLog(@"%@", [NSThread currentThread]);
           s = [NSString stringWithFormat:@"%@\n%@", s, [NSThread currentThread]];
        });
    }
    
    dispatch_group_notify(group, quene, ^ {
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            self.threadState.text = s;
        });
    });
}

- (void)globleThread_sync {
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    __block NSString* s = [NSString stringWithFormat:@""];
    for (int i = 0; i < 5; i++) {
        dispatch_sync(quene, ^(void) {
            NSLog(@"%@", [NSThread currentThread]);
            s = [NSString stringWithFormat:@"%@\n%@", s, [NSThread currentThread]];
        });
    }
    self.threadState.text = s;
}

@end
