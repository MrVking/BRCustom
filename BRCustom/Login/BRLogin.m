//
//  BRLogin.m
//  BRGeneral
//
//  Created by Mike Villegas on 07/07/18.
//  Copyright © 2018 Mike Villegas. All rights reserved.
//

#import "BRLogin.h"
#import "BRRequestOperations.h"


@interface BRLogin()
@property(nonatomic,strong) BRRequestOperations *loginOperation;
@property(nonatomic, strong)NSOperationQueue *operationQueue;
@end

@implementation BRLogin
-(id)init{
    if (self = [super init]) {
        // Initialize self
    }
    return self;
}
-(void)getLoginDataWithCompletionHandler:(void (^)(NSDictionary *result, NSError *error, BOOL wasCancelled))completion{
    _loginOperation = [[BRRequestOperations alloc]init];
    _loginOperation.urlRequest    =   @"http://json.banregio.io/login";
    _loginOperation.completionHandler= ^(id result, NSError *error,BOOL wasCancelled){
        if(error)
            NSLog(@"%@",[NSString stringWithFormat:@"La Operación tuvo un error %@", error.description]);
        if(wasCancelled){
            NSLog(@"%@",[NSString stringWithFormat:@"La Operación fue cancelada"]);
        }
        if (completion)
            completion(result, error,wasCancelled);
    };
    _operationQueue=[NSOperationQueue new];
    [_operationQueue addOperation:_loginOperation];
}
@end
