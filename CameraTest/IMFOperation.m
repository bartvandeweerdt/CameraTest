//
//  IMFOperation.m
//  CameraTest
//
//  Created by Bart on 14/11/13.
//  Copyright (c) 2013 iDA MediaFoundry. All rights reserved.
//

#import "IMFOperation.h"

@implementation IMFOperation

- (void)main {
    // a lengthy operation
    @autoreleasepool {
        for (int i = 0 ; i < 10000 ; i++) {
            NSLog(@"%f", sqrt(i));
        }
    }
}

@end
