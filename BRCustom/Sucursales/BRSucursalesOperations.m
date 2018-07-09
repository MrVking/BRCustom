//
//  BRSucursalesOperations.m
//  sqliteTest
//
//  Created by M.V. on 09/07/18.
//

#import "BRSucursalesOperations.h"
#import "BRRequestOperations.h"
#import "BRSucursal.h"

@interface BRSucursalesOperations()
    @property(nonatomic,strong) BRRequestOperations *sucursalesOperation;
    @property(nonatomic, strong)NSOperationQueue *operationQueue;
@end

@implementation BRSucursalesOperations


-(id)init{
    if (self = [super init]) {
        // Initialize self
    }
    return self;
}


-(void)getSucursalesDataWithCompletionHandler:(void (^)(NSArray *result, NSError *error, BOOL wasCancelled))completion{
    _sucursalesOperation = [[BRRequestOperations alloc]init];
    _sucursalesOperation .urlRequest    =   @"http://json.banregio.io/sucursales";
    _sucursalesOperation .completionHandler= ^(id result, NSError *error,BOOL wasCancelled){
        if(error)
            NSLog(@"%@",[NSString stringWithFormat:@"La Operación tuvo un error %@", error.description]);
        if(wasCancelled){
            NSLog(@"%@",[NSString stringWithFormat:@"La Operación fue cancelada"]);
        }
        NSMutableArray *sucursalesArray = [[NSMutableArray alloc]init];
        for (id tempObject in result) {
            BRSucursal * sucursal = [[BRSucursal alloc]init];
            sucursal.abre24HORAS = [tempObject objectForKey:@"24_HORAS"];
            sucursal.ciudad = [tempObject objectForKey:@"CIUDAD"];
            sucursal.domicilio = [tempObject objectForKey:@"DOMICILIO"];
            sucursal.estado = [tempObject objectForKey:@"ESTADO"];
            sucursal.horario = [tempObject objectForKey:@"HORARIO"];
            sucursal.idSucursal = [tempObject objectForKey:@"ID"];
            sucursal.latitud = [tempObject objectForKey:@"Latitud"];
            sucursal.longitud = [tempObject objectForKey:@"Longitud"];
            sucursal.nombre = [tempObject objectForKey:@"NOMBRE"];
            sucursal.abreSabados = [tempObject objectForKey:@"SABADOS"];
            sucursal.suc_Estado_Prioridad = [tempObject objectForKey:@"Suc_Ciudad_Prioridad"];
            sucursal.suc_Ciudad_Prioridad = [tempObject objectForKey:@"Suc_Estado_Prioridad"];
            sucursal.telefono_app = [tempObject objectForKey:@"TELEFONO_APP"];
            sucursal.telefono_portal = [tempObject objectForKey:@"TELEFONO_PORTAL"];
            sucursal.url_foto = [tempObject objectForKey:@"URL_FOTO"];
            sucursal.tipo = [tempObject objectForKey:@"tipo"];
            [sucursalesArray addObject:sucursal];

        }
        
        if (completion)
            completion(sucursalesArray, error,wasCancelled);
    };
    _operationQueue=[NSOperationQueue new];
    [_operationQueue addOperation:self.sucursalesOperation ];
}
@end
