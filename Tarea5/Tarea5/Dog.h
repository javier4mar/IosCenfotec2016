//
//  Dog.h
//  Tarea5
//
//  Created by Javier Hernandez on 7/12/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface Dog : RLMObject

@property NSString *name;
@property NSString *imageDog;
@property NSString *color;
@property NSDate *createdDate;


@end
RLM_ARRAY_TYPE(Dog) // define RLMArray<Person>
