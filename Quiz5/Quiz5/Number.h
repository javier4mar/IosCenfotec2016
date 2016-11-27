//
//  Number.h
//  Quiz5
//
//  Created by Javier Hernandez on 26/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Number : NSObject

@property(nonatomic,strong) NSString *number;
@property(nonatomic,assign) NSString *multiply;
@property(nonatomic,assign) NSString *result;


+(NSMutableArray*)getMyMultiply:(int)number;


@end
