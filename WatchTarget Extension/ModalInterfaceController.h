//
//  ModalInterfaceController.h
//  WatchTestApp
//
//  Created by Somogyi András on 06/01/16.
//  Copyright © 2016 Somogyi András. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface ModalInterfaceController : WKInterfaceController
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *modalLabel;

@end
