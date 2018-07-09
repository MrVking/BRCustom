//
//  BRRequestOperations.h
//  BRGeneral
//
//  Created by Mike Villegas on 07/07/18.
//  Copyright © 2018 Mike Villegas. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^completion_block_t)(id result, NSError * error, BOOL wasCancelled);

@interface BRRequestOperations : NSOperation
    @property (nonatomic) NSString * urlRequest;
    @property (nonatomic, readonly) id result;
    @property (nonatomic, copy) completion_block_t completionHandler;
@end
