//
//  EditorTextView.m
//  ZKRichTextEditor
//
//  Created by LSH on 2019/1/8.
//  Copyright © 2019 None. All rights reserved.
//

#import "EditorTextView.h"
@implementation EditorTextView

-(instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addObserver];
    }
    return self;
}

-(void)addObserver

{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginediting:) name:UITextViewTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doediting:) name:UITextViewTextDidChangeNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endediting:) name:UITextViewTextDidEndEditingNotification object:self];
}



-(void)beginediting:(NSNotification *)notification

{
    NSLog(@"开始编辑");
}
-(void)doediting:(NSNotification *)notification

{
    [self updateAttributes];
    NSLog(@"正在编辑");
}
-(void)endediting:(NSNotification *)notification

{
    NSLog(@"停止编辑");
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
