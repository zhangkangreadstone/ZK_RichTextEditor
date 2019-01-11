//
//  UITextView+RichText.m
//  ZKRichTextEditor
//
//  Created by LSH on 2019/1/8.
//  Copyright © 2019 None. All rights reserved.
//

#import "UITextView+RichText.h"
#import <objc/runtime.h>

@implementation UITextView (RichText)
//特殊字样的开始编辑位置属性
- (NSInteger)startLoc
{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}
- (void)setStartLoc:(NSInteger)loc
{
    objc_setAssociatedObject(self, @selector(startLoc), @(loc), OBJC_ASSOCIATION_ASSIGN);
}
//当前编辑状态的属性字典
- (NSMutableDictionary *)currentAttributes
{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setCurrentAttributes:(NSMutableDictionary *)currentAttributes
{
    objc_setAssociatedObject(self, @selector(currentAttributes), currentAttributes, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



//加粗
- (void)insertBold
{
    UIFont *font = [UIFont systemFontOfSize:15];
    if (self.currentAttributes[NSFontAttributeName]) {
        font = self.currentAttributes[NSFontAttributeName];
    }

    [self addAttribute:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:font.pointSize]}];
}
//去除加粗
- (void)deleteBold
{
    UIFont *font = [UIFont systemFontOfSize:15];
    if (self.currentAttributes[NSFontAttributeName]) {
        font = self.currentAttributes[NSFontAttributeName];
    }
    [self addAttribute:@{NSFontAttributeName:[UIFont systemFontOfSize:font.pointSize]}];
}
//12号字体
- (void)font12
{
    [self fontSize:12];
}
//15号字体
- (void)font15
{
    [self fontSize:15];
}

//17号字体
- (void)font17
{
    [self fontSize:19];
}

//19号字体
- (void)font19
{
    [self fontSize:19];
}

//设置字体大小
- (void)fontSize:(CGFloat)size
{
    UIFont *font = [UIFont systemFontOfSize:15];
    if (self.currentAttributes[NSFontAttributeName]) {
        font = self.currentAttributes[NSFontAttributeName];
    }
    [self addAttribute:@{NSFontAttributeName:[font fontWithSize:15]}];
}

//下划线
- (void)underLine
{
    [self addAttribute:@{NSUnderlineStyleAttributeName:@(1)}];
}
//删除下划线
- (void)deleteUnderLine
{
    [self addAttribute:@{NSUnderlineStyleAttributeName:@(0)}];
}

//删除线
- (void)deleteLine
{
    [self addAttribute:@{NSStrikethroughStyleAttributeName:@(1)}];
}
//去除删除线
- (void)deleteDeleteLine
{
    [self addAttribute:@{NSStrikethroughStyleAttributeName:@(0)}];
}
//字体倾斜
- (void)textObli
{
    [self addAttribute:@{NSObliquenessAttributeName:@(0.5)}];
}
//去除字体倾斜
- (void)deleteObli
{
    [self addAttribute:@{NSObliquenessAttributeName:@(0)}];
}

//换行
- (void)returnBtn
{
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    [attriStr appendAttributedString:[[NSAttributedString alloc]initWithString:@"\n"]];
    self.attributedText = attriStr;
}


- (void)addParah
{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.headIndent = 20.0;
    style.firstLineHeadIndent = 20.0;
    [self addAttribute:@{NSParagraphStyleAttributeName:style}];
}
- (void)deleteParah
{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    [self addAttribute:@{NSParagraphStyleAttributeName:style}];
}

//添加文字属性
- (void)addAttribute:(NSDictionary *)dic
{
    NSRange range = self.selectedRange;
    self.startLoc = range.location;
    [self.currentAttributes setObject:dic.allValues[0] forKey:dic.allKeys[0]];
    if (range.length) {
        [self updateAttributes];
    }
}
//删除文字属性
- (void)deleteAttribute:(id)key
{
    NSRange range = self.selectedRange;
    self.startLoc = range.location;
    [self.currentAttributes removeObjectForKey:key];
    if (range.length) {
        [self updateAttributes];
    }
}

//实时更新输入的文字样式
- (void)updateAttributes
{
    if (!self.currentAttributes) {
        self.currentAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15]}.mutableCopy;
    }
    NSRange range = self.selectedRange;
    if (!range.length) {
        range = NSMakeRange(self.startLoc, self.text.length-self.startLoc);
    }
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    [attriStr addAttributes:self.currentAttributes range:range];
    self.attributedText = attriStr;
}








////富文本转换为html(最后相当于整个网页代码，会有css等)
//NSDictionary *dic = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,                 NSCharacterEncodingDocumentAttribute:@(NSUnicodeStringEncoding)};
//NSData *data = [att dataFromRange:NSMakeRange(0, att.length) documentAttributes:dic error:nil];
//NSString *str = [[NSString alloc] initWithData:data encoding:NSUnicodeStringEncoding];


@end
