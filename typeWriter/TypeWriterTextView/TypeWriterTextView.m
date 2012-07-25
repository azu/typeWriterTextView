//
//  Created by azu on 12/07/25.
//


#import "TypeWriterTextView.h"

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
}

@synthesize typeInterval = typeInterval_;
@synthesize typeText = typeText_;
@synthesize timer = timer_;
@synthesize typeCounter = typeCounter_;
@synthesize typeCharactersPerSec = typeCharactersPerSec_;


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (!self){
        return nil;
    }
    // 初期値
    self.typeCharactersPerSec = 18;// type char per second
    self.typeInterval = 1 / self.typeCharactersPerSec;
    self.typeCounter = 0;

    return self;
}

- (void)setTypeCharactersPerSec:(NSTimeInterval)typeCharactersPerSec {
    typeCharactersPerSec_ = typeCharactersPerSec;
    self.typeInterval = 1 / self.typeCharactersPerSec;
}

- (void)updateText:(NSString *)text {
    self.text = text;
}

- (void)appendText {
    if ([self.typeText length] <= self.typeCounter){
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
    NSLog(@"self.timer = %@", self.timer);
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
@end