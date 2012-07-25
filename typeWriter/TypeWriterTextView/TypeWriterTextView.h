//
//  Created by azu on 12/07/25.
//


#import <Foundation/Foundation.h>


@interface TypeWriterTextView : UITextView

@property(nonatomic) NSTimeInterval typeInterval;
@property(nonatomic, copy) NSString *typeText;
@property(nonatomic) NSTimeInterval typeCharactersPerSec;

- (void)startTypeWriterAnimation;

- (void)stopTypeWriterAnimation;

- (void)clearTypeWriter;


@end