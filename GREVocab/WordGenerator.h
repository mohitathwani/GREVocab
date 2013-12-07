//
//  WordGenerator.h
//  GREVocab
//
//  Created by Labs on 12/7/13.
//  Copyright 2013 Tera Mo labs. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@protocol WordGeneratorDelegate <NSObject>

-(void)doneDownloading;

@end

@interface WordGenerator : NSObject
+ (WordGenerator*) sharedInstance;
- (void)downloadJSONFile;

@property (nonatomic, strong) NSArray *jsonArray;
@property(nonatomic, getter = isDownloadDone) BOOL downloadDone;
@property(nonatomic, weak) id <WordGeneratorDelegate> delegate;
@end
