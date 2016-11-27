//
//  Number.m
//  Quiz5
//
//  Created by Javier Hernandez on 26/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "Number.h"

@implementation Number


+(NSMutableArray*)getMyMultiply:(int)number{
    
    NSMutableArray *mutable = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 50; i++)
    {
        Number* numberObj = [Number alloc];
        numberObj.number = [NSString stringWithFormat:@"%d",number] ;
        numberObj.multiply = [NSString stringWithFormat:@"%d",i] ;
        
        int result =number * i;
        numberObj.result = [NSString stringWithFormat:@"%d",result] ;
        
        
        [mutable addObject: numberObj];
        NSLog(@"%d %@ %d %@ %d",number , @"X",i,@"=", result );
        
    }
    return mutable;
}


@end
