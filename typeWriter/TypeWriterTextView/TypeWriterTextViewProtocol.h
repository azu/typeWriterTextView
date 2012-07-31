//
//  Created by azu on 12/07/25.
//

@class TypeWriterTextView;

@protocol TypeWriterTextViewProtocol <UIScrollViewDelegate, UITextViewDelegate>

@optional
- (void)completeTypingText:(TypeWriterTextView *)typeWriterTextView;

@end