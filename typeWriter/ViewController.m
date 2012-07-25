//
//  ViewController.m
//  typeWriter
//
//  Created by azu on 07/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "TypeWriterTextView.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize typeWriterTextView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // init text
    self.typeWriterTextView.typeText = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";
    self.typeWriterTextView.typeCharactersPerSec = 24;// type char count per second
}

- (void)viewDidUnload {
    [self setTypeWriterTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)stopButton:(id)sender {
    [self.typeWriterTextView stopTypeWriterAnimation];
}

- (IBAction)startButton:(id)sender {
    [self.typeWriterTextView startTypeWriterAnimation];
}

- (IBAction)clearButton:(id)sender {
    [self.typeWriterTextView clearTypeWriter];
}
@end