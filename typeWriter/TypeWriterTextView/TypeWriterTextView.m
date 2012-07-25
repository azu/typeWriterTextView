//
//  Created by azu on 12/07/25.
//


#import "TypeWriterTextView.h"
#import "TypeWriterTextViewProtocol.h"

@interface TypeWriterTextView ()

@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic) NSUInteger typeCounter;


@end

@implementation TypeWriterTextView {

@private
    NSTimeInterval typeInterval_;
    NSString *typeText_;
    NSTimer *timer_;
    NSUInteger typeCounter_;
    NSTimeInterval typeCharactersPerSec_;
    __weak id <TypeWriterTextViewProtocol> typeWriterDelegate_;
}

@synthesize typeInterval = typeInterval_;
@synthesize typeText = typeText_;
@synthesize timer = timer_;
@synthesize typeCounter = typeCounter_;
@synthesize typeCharactersPerSec = typeCharactersPerSec_;
@synthesize typeWriterDelegate = typeWriterDelegate_;


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (!self){
        return nil;
    }
    // 初期値
    self.typeCharactersPerSec = 18;// type char per second
    self.typeInterval = 1 / self.typeCharactersPerSec;
    self.typeCounter = 0;
    self.userInteractionEnabled = NO;
    return self;
}

- (void)setTypeCharactersPerSec:(NSTimeInterval)typeCharactersPerSec {
    typeCharactersPerSec_ = typeCharactersPerSec;
    self.typeInterval = 1 / self.typeCharactersPerSec;
}

- (void)updateText:(NSString *)text {
    self.text = text;
}

- (void)finishTypingText {
    [self stopTypeWriterAnimation];
    self.typeCounter = [self.typeText length];
    [self updateText:self.typeText];
}

- (BOOL)isFinishedTyping {
    if ([self.typeText length] <= self.typeCounter){
        return YES;
    }
    return NO;
}

- (void)appendText {
    if ([self isFinishedTyping]){
        [self callbackDelegate];
        [self stopTypeWriterAnimation];
        return;
    }
    NSString *typeString = [self.typeText substringToIndex:self.typeCounter];
    [self updateText:typeString];
    self.typeCounter++;
}

- (void)startTypeWriterAnimation {
    [self stopTypeWriterAnimation];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.typeInterval
        target:self
        selector:@selector(appendText)
        userInfo:nil repeats:YES];
    [self.timer fire];
}

- (void)stopTypeWriterAnimation {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)clearTypeWriter {
    [self stopTypeWriterAnimation];
    self.text = @"";
    self.typeCounter = 0;
}


- (void)callbackDelegate {
    if ([self.typeWriterDelegate respondsToSelector:@selector(completeTypingText)]){
        [self.typeWriterDelegate completeTypingText];
    }
}

#pragma mark - userInteraction
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![self isFinishedTyping]){
        [self finishTypingText];
    }
    [self callbackDelegate];
}


@end