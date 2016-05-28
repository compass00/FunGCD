//
//  ViewController.h
//  FunGCD
//
//  Created by JiaLi on 16/5/28.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic)IBOutlet UILabel* mainthreadState;

@property (strong, nonatomic)IBOutlet UILabel* threadState;
@property (nonatomic) int type;
@property (nonatomic, strong) NSString* nvtitle;
@end

