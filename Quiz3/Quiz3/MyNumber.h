//
//  MyNumber.h
//  Quiz3
//
//  Created by Javier Hernandez on 12/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyNumber : NSObject


@property(nonatomic,strong) NSString *number;
@property(nonatomic,assign) NSString *primo;

+(NSMutableArray*) getMyNumbers;

@end
