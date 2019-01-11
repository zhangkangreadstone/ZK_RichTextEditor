//
//  ViewController.m
//  ZKRichTextEditor
//
//  Created by LSH on 2019/1/8.
//  Copyright © 2019 None. All rights reserved.
//

#import "ViewController.h"
#import "EditorTextView.h"
#define kScreenW [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@property (nonatomic,strong) EditorTextView *textView;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self textView];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(40, 400, 50, 35);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    UIButton *btn0 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn0.frame = CGRectMake(100, 400, 50, 35);
    btn0.backgroundColor = [UIColor redColor];
    [btn0 addTarget:self action:@selector(btn0Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn0];
}

- (void)btnClicked:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self.textView addParah];
    }else{
        [self.textView deleteParah];
    }
}

- (void)btn0Clicked:(UIButton *)sender
{
    [self.textView undoAction];
}

-(EditorTextView *)textView
{
    if (!_textView) {
        _textView = [[EditorTextView alloc]initWithFrame:CGRectMake(20, 90, kScreenW-40, 200)];
        _textView.backgroundColor = [UIColor cyanColor];
        [self.view addSubview:_textView];
    }
    return _textView;
}

@end
