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
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://copy.com/rxqBn4nuyqXm" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.jsonArray = (NSArray *)responseObject;
        NSLog(@"%@", self.jsonArray);
        [self generateNewWord];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    
}

- (void) generateNewWord {
    
    int random = arc4random() % [self.jsonArray count];
    
    self.wordLabel.text = self.jsonArray[random][@"Word"];
    self.partOfSpeechLabel.text = self.jsonArray[random][@"Part of Speech"];
    self.definitionTextView.text = self.jsonArray[random][@"Definition"];
    self.sentenceTextView.text = self.jsonArray[random][@"Sentence"];
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
