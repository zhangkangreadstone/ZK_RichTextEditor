//
//  EditorTextView.h
//  ZKRichTextEditor
//
//  Created by LSH on 2019/1/8.
//  Copyright © 2019 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextView+RichText.h"

NS_ASSUME_NONNULL_BEGIN

@interface EditorTextView : UITextView

- (void)undoAction;
- (void)redoAction;

@end

NS_ASSUME_NONNULL_END
