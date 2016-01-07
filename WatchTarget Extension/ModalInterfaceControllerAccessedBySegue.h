//
//  ModalInterfaceControllerAccessedBySegue.h
//  WatchTestApp
//
//  Created by Somogyi András on 07/01/16.
//  Copyright © 2016 Somogyi András. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface ModalInterfaceControllerAccessedBySegue : WKInterfaceController

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *contextLabel;

@end
