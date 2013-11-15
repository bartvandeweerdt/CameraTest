//
//  IMFOperation.h
//  CameraTest
//
//  Created by Bart on 14/11/13.
//  Copyright (c) 2013 iDA MediaFoundry. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMFOperationDelegate;

@interface IMFOperation : NSOperation

@end

@protocol IMFOperationDelegate<NSObject>

- (void)operationDidFinish:(IMFOperation *)operation;

@end
