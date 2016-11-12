//
//  MyNumber.m
//  Quiz3
//
//  Created by Javier Hernandez on 12/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "MyNumber.h"

@implementation MyNumber


+(NSMutableArray*) getMyNumbers{
    
    NSMutableArray *mutable = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 1000; i++)
    {
        MyNumber* numberObj = [MyNumber alloc];
        numberObj.number = [NSString stringWithFormat:@"%d",i] ;
        
        int b =0;
        for(int a=1;a<=i;a++)
        {
            if(i%a==0){ // si num1 módulo de i es 0, incrementamos a en 1.
                b++;
            }
        }
        
        if ( b == 2 ){
            numberObj.primo =  @"SI";
        }else{
            numberObj.primo = @"NO";
         }
        
        [mutable addObject: numberObj];

    }
    
    return mutable;
}



@end
