//
//  Numbers.m
//  Quiz4
//
//  Created by Javier Hernandez on 19/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "Numbers.h"

@implementation Numbers



+(NSMutableArray*)getMyNumbers{
    NSMutableArray *mutable = [[NSMutableArray alloc] init];
    int i;
    Boolean flag = true;
    for (i = 1; i<=1500; i++) {
       
        
        Numbers* numberObj = [Numbers alloc];
        numberObj.number = [NSString stringWithFormat:@"%d" ,i ] ;
        
        if(flag){
            numberObj.par = true;
            flag = false;
        }else{
            numberObj.par = false;
            flag = true;
            
        }
        [mutable addObject: numberObj];
        
    }
    
    return mutable;

}

@end
