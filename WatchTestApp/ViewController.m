//
//  ViewController.m
//  WatchTestApp
//
//  Created by Somogyi András on 05/01/16.
//  Copyright © 2016 Somogyi András. All rights reserved.
//

#import "ViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>

typedef void(^ReplyHandler)(NSDictionary<NSString *,id> * _Nonnull);

@interface ViewController () <WCSessionDelegate, NSURLSessionDownloadDelegate>

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (copy, nonatomic) ReplyHandler replyHandler;
@property (weak, nonatomic) NSURLSession *urlSession;

@end

@implementation ViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initializing  background url session
    NSURLSessionConfiguration *urlSessionConfiguration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"backgroundUrlSession"];
    self.urlSession = [NSURLSession sessionWithConfiguration:urlSessionConfiguration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    // Initializing Watch Conntectivity session
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        if ([session isReachable]) {
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WCSession delegate methods
-(void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message replyHandler:(void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler {
    self.replyHandler = replyHandler;
    dispatch_async(dispatch_get_main_queue(), ^{
        self.messageLabel.hidden = NO;
        self.messageLabel.text = message[@"Message"];
    });


    [[self.urlSession downloadTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=jack+johnson&limit=5"]] resume];
}

#pragma mark - URLSession delegate methods
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSData *responseData = [NSData dataWithContentsOfURL:location];
    NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
    self.replyHandler(responseDictionary);
}

@end
