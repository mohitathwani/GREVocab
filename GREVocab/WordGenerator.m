//
//  WordGenerator.m
//  GREVocab
//
//  Created by Labs on 12/7/13.
//  Copyright 2013 Tera Mo labs. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89	
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import "WordGenerator.h"

@implementation WordGenerator

#pragma mark -
#pragma mark Singleton Methods

+ (WordGenerator*)sharedInstance {

	static WordGenerator *_sharedInstance;
	if(!_sharedInstance) {
		static dispatch_once_t oncePredicate;
		dispatch_once(&oncePredicate, ^{
			_sharedInstance = [[super allocWithZone:nil] init];
			});
		}

		return _sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {	

	return [self sharedInstance];
}


- (id)copyWithZone:(NSZone *)zone {
	return self;	
}

#if (!__has_feature(objc_arc))

- (id)retain {	

	return self;	
}

- (unsigned)retainCount {
	return UINT_MAX;  //denotes an object that cannot be released
}

- (void)release {
	//do nothing
}

- (id)autorelease {

	return self;	
}
#endif

#pragma mark -
#pragma mark Custom Methods

// Add your custom methods here

- (void)downloadJSONFile {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://copy.com/rxqBn4nuyqXm" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.jsonArray = (NSArray *)responseObject;
        NSLog(@"%@", self.jsonArray);
        self.downloadDone = YES;
        [self.delegate doneDownloading];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        self.downloadDone = NO;
    }];
}

@end
