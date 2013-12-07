//
//  GVViewController.m
//  GREVocab
//
//  Created by Mohit Athwani on 30/11/13.
//  Copyright (c) 2013 Tera Mo labs. All rights reserved.
//

#import "GVViewController.h"

@interface GVViewController ()

@end

@implementation GVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [WordGenerator sharedInstance].delegate = self;
    
    
    
}

- (void) generateNewWord {
    
    int random = arc4random() % [[WordGenerator sharedInstance].jsonArray count];
    
    self.wordLabel.text = [[[WordGenerator sharedInstance].jsonArray objectAtIndex:random] objectForKey:@"Word"];
    self.partOfSpeechLabel.text = [[[WordGenerator sharedInstance].jsonArray objectAtIndex:random] objectForKey:@"Part of Speech"];
    self.definitionTextView.text = [[[WordGenerator sharedInstance].jsonArray objectAtIndex:random] objectForKey:@"Definition"];
    self.sentenceTextView.text = [[[WordGenerator sharedInstance].jsonArray objectAtIndex:random] objectForKey:@"Sentence"];
}

- (void)doneDownloading {
    [self generateNewWord];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapGesture:(UITapGestureRecognizer *)sender {
    [self generateNewWord];
}
@end
