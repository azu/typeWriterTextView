//
//  ViewController.h
//  typeWriter
//
//  Created by azu on 07/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TypeWriterTextView;

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet TypeWriterTextView *typeWriterTextView;

- (IBAction)stopButton:(id)sender;
- (IBAction)startButton:(id)sender;
- (IBAction)clearButton:(id)sender;
@end