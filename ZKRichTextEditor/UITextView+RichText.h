//
//  UITextView+RichText.h
//  ZKRichTextEditor
//
//  Created by LSH on 2019/1/8.
//  Copyright © 2019 None. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (RichText)

@property (nonatomic,strong) NSMutableDictionary *currentAttributes;//当前文本的状态
@property (nonatomic,assign) NSInteger startLoc;
- (void)insertBold;
- (void)deleteBold;

- (void)font12;
- (void)font15;
- (void)font17;
- (void)font19;

- (void)underLine;
- (void)deleteUnderLine;

- (void)deleteLine;
- (void)deleteDeleteLine;

- (void)textObli;
- (void)deleteObli;

- (void)returnBtn;

- (void)addParah;
- (void)deleteParah;

- (void)updateAttributes;
@end

NS_ASSUME_NONNULL_END
