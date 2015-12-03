//
//  ViewController.m
//  01-Masonry框架分析
//
//  Created by apple on 15/10/18.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "ViewController.h"

#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 创建红色view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    void(^block)(MASConstraintMaker *make) = ^(MASConstraintMaker *make){
        // block:给控件设置约束
//        MASViewConstraint *newConstraint = make.left.top;
//        
//        MASConstraint * (^block)(id attribute) = newConstraint.equalTo;
//        
//        block(@10);
        
        make.left.top.equalTo(@10);
//        newConstraint.equalTo(@10);
        
        make.right.bottom.equalTo(@-10);
    };
    // 1.创建约束制造者
//    MASConstraintMaker *maker = [[MASConstraintMaker alloc] initWithView:redView];
//    block(maker);
    
    // 设置redView约束
    [redView mas_makeConstraints:block];
    
    //  masonry框架分析
    //  mas_makeConstraints底层实现
    // 1.1.创建约束制造者
    // 1.2 执行block,并且把创建好的约束制造者传进去,(给约束制造者添加约束)
    // 1.3 [constraintMaker install]给控件设置约束
    // 1.4  install底层实现
    // 1.5  把控件之前所有约束移除.
    // 1.6  遍历约束制造者中保存的所有约束,安装到控件.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
