//
//  BRDataBaseManager.h
//  sqliteTest
//
//  Created by M.V. on 09/07/18.
//

#import <Foundation/Foundation.h>

@interface BRDataBaseManager : NSObject
@property (nonatomic) int affectedRows;
@property (nonatomic) long long lastInsertedRowID;
@property (nonatomic, strong) NSMutableArray *arrResults;

-(NSArray *)loadDataFromDB:(NSString *)query;
-(void)executeQuery:(NSString *)query;
-(instancetype)initWithDatabaseFilename:(NSString *)dbFilename;
@end
