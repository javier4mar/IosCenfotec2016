//
//  Fibonaccii.m
//  MyFibonacci
//
//  Created by Javier Hernandez on 17/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "Fibonaccii.h"

@implementation Fibonaccii

+(NSMutableArray*)getMyFibonaccii{
    
    NSMutableArray *mutable = [[NSMutableArray alloc] init];
        double a = 0;
        double b = 1;
        double i;
        double result = a + b;
    
       for (i = 0; i<=1000; i++) {
            a = b;
            b = result;
            result = a + b;
            
            Fibonaccii* numberObj = [Fibonaccii alloc];
            numberObj.number = [NSString stringWithFormat:@"%1.0f" ,round(result) ] ;
            

            [mutable addObject: numberObj];

        }

    return mutable;
}



@end
