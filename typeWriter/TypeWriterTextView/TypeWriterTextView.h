//
//  Created by azu on 12/07/25.
//


#import <Foundation/Foundation.h>

@protocol TypeWriterTextViewProtocol;


@interface TypeWriterTextView : UITextView {
}

@property(nonatomic) NSTimeInterval typeInterval;
@property(nonatomic, copy) NSString *typeText;
@property(nonatomic) NSTimeInterval typeCharactersPerSec;
@property(nonatomic, weak) id <TypeWriterTextViewProtocol> typeWriterDelegate;

- (void)startTypeWriterAnimation;

- (void)stopTypeWriterAnimation;

- (void)clearTypeWriter;

- (void)finishTypingText;


@end