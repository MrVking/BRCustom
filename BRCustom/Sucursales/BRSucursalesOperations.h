//
//  BRSucursalesOperations.h
//  sqliteTest
//
//  Created by M.V. on 09/07/18.
//

#import <Foundation/Foundation.h>

@interface BRSucursalesOperations : NSObject
    -(void)getSucursalesDataWithCompletionHandler:(void (^)(NSArray *result, NSError *error, BOOL wasCancelled))completion;
@end
