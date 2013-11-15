//
//  IMFOperation.m
//  CameraTest
//
//  Created by Bart on 14/11/13.
//  Copyright (c) 2013 iDA MediaFoundry. All rights reserved.
//

#import "IMFOperation.h"

@interface IMFOperation()
@property (nonatomic, strong) UIView *theView;
@property (nonatomic, assign) id<IMFOperationDelegate> delegate;
@end

@implementation IMFOperation

- (void)main {
    @autoreleasepool {
        self.theView = [[UIView alloc] init];
        
        for (int i = 0 ; i < 2 ; i++) {
            NSLog(@"%f", sqrt(i));
        }
        
        [(NSObject *) self.delegate performSelectorOnMainThread:@selector(operationDidFinish:) withObject:self waitUntilDone:NO];

    }
}

@end
