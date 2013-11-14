//
//  ViewController.m
//  CameraTest
//
//  Created by Bart on 13/11/13.
//  Copyright (c) 2013 iDA MediaFoundry. All rights reserved.
//

#import <MobileCoreServices/MobileCoreServices.h>
#import "ViewController.h"
#import "IMFOperation.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSOperationQueue *)operationQueue {
    if (!_operationQueue) {
        _operationQueue = [[NSOperationQueue alloc] init];
        _operationQueue.name = @"imfqueue";
        _operationQueue.maxConcurrentOperationCount = 1;
    }
    return _operationQueue;
}

- (IBAction)cameraBtnTap:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        self.imagePicker = [[UIImagePickerController alloc] init];
        
        self.imagePicker.delegate = self;
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
        self.imagePicker.allowsEditing = NO;
        //imagePicker.navigationBarHidden = YES;
        //self.imagePicker.toolbarHidden = YES;
        //imagePicker.modalPresentationStyle = UIModalPresentationPageSheet;
        
        [self presentViewController:self.imagePicker animated:NO completion:nil];
        
    } else {
        // TODO: Show alert
    }
}

- (IBAction)gcdBtnTap:(id)sender {
    IMFOperation *operation = [[IMFOperation alloc] init];
    [self.operationQueue addOperation:operation];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissViewControllerAnimated:YES completion:nil];
    self.imagePicker = nil;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
    self.imagePicker = nil;
}

@end
