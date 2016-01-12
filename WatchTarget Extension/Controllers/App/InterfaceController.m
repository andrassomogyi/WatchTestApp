//
//  InterfaceController.m
//  WatchTarget Extension
//
//  Created by Somogyi András on 05/01/16.
//  Copyright © 2016 Somogyi András. All rights reserved.
//

#import "InterfaceController.h"
#import "RowController.h"
#import "WatchTarget_Extension-Swift.h"


@interface InterfaceController()

@property(nonatomic, strong) NSArray *dataForTable;

@end


@implementation InterfaceController

#pragma mark - Lifecycle
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    self.dataForTable = @[@"Alice",@"White Knight",@"Red Queen"];

}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    [self setupTable:self.dataForTable];
}


- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - Row setup
- (void)setupTable:(NSArray *)rowDataArray {
    [self.table setNumberOfRows:rowDataArray.count withRowType:@"MainRowType"];
    for (NSInteger i = 0; i < self.table.numberOfRows; i++) {
        RowController *row = [self.table rowControllerAtIndex:i];
        [row.rowLabel setText:rowDataArray[i]];
    }
}

#pragma mark - Table delegate methods
-(void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    [self presentControllerWithName:@"ModalInterfaceController" context:self.dataForTable[rowIndex]];
//    [self pushControllerWithName:@"ModalInterfaceController" context:self.dataForTable[rowIndex]];
}

-(void)handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)remoteNotification {
    dispatch_async(dispatch_get_main_queue(), ^{
            [self presentControllerWithName:@"ModalInterfaceController" context:self.dataForTable[0]];
    });
    NSLog(@"Test");
}
@end



