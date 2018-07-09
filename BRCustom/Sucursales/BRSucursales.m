//
//  BRSucursales.m
//  BRGeneral
//
//  Created by Mike Villegas on 07/07/18.
//  Copyright © 2018 Mike Villegas. All rights reserved.
//

#import "BRSucursales.h"
#import "BRRequestOperations.h"

@interface BRSucursales()
    @property(nonatomic,strong) BRRequestOperations *sucursalesOperation;
    @property(nonatomic, strong)NSOperationQueue *operationQueue;
@end
@implementation BRSucursales

-(id)init{
    if (self = [super init]) {
        // Initialize self
    }
    return self;
}
-(void)getSucursalesDataWithCompletionHandler:(void (^)(NSDictionary *result, NSError *error, BOOL wasCancelled))completion{
    _sucursalesOperation = [[BRRequestOperations alloc]init];
    _sucursalesOperation .urlRequest    =   @"http://json.banregio.io/sucursales";
    _sucursalesOperation .completionHandler= ^(id result, NSError *error,BOOL wasCancelled){
        if(error)
            NSLog(@"%@",[NSString stringWithFormat:@"La Operación tuvo un error %@", error.description]);
        if(wasCancelled){
            NSLog(@"%@",[NSString stringWithFormat:@"La Operación fue cancelada"]);
        }
        if (completion)
            completion(result, error,wasCancelled);
    };
    _operationQueue=[NSOperationQueue new];
    [_operationQueue addOperation:self.sucursalesOperation ];
}
@end
