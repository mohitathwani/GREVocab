//
//  GVViewController.h
//  GREVocab
//
//  Created by Mohit Athwani on 30/11/13.
//  Copyright (c) 2013 Tera Mo labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordGenerator.h"

@interface GVViewController : UIViewController<WordGeneratorDelegate>


@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UILabel *partOfSpeechLabel;
@property (weak, nonatomic) IBOutlet UITextView *definitionTextView;
@property (weak, nonatomic) IBOutlet UITextView *sentenceTextView;
- (IBAction)tapGesture:(UITapGestureRecognizer *)sender;

@end
