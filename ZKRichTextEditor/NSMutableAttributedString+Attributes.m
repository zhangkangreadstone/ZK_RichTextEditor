//
//  NSMutableAttributedString+Attributes.m
//  ZKRichTextEditor
//
//  Created by LSH on 2019/1/9.
//  Copyright © 2019 None. All rights reserved.
//

#import "NSMutableAttributedString+Attributes.h"

@implementation NSMutableAttributedString (Attributes)




- (void)addAttributeWithFont:(UIFont *)font color:(UIColor *)color forRange:(NSRange)range
{
    if (self.length) {
        NSDictionary*attriDict =@{NSForegroundColorAttributeName:color,NSFontAttributeName:font};
        [self addAttributes:attriDict range:range];
    }
}

@end
