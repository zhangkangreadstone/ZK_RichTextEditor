//
//  NSMutableAttributedString+Attributes.h
//  ZKRichTextEditor
//
//  Created by LSH on 2019/1/9.
//  Copyright © 2019 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (Attributes)
- (void)addAttributeWithFont:(UIFont *)font color:(UIColor *)color forRange:(NSRange)range;

@end

NS_ASSUME_NONNULL_END
