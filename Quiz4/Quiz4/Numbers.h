//
//  Numbers.h
//  Quiz4
//
//  Created by Javier Hernandez on 19/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Numbers : NSObject


@property(nonatomic,strong) NSString *number;
@property(nonatomic) Boolean par;

+(NSMutableArray*)getMyNumbers;


@end
