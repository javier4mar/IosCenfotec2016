//
//  RealManager.m
//  Quiz6
//
//  Created by Javier Hernandez on 3/12/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//
#import <Realm/Realm.h>
#import "RealManager.h"
#import "Person.h"

#define PERSON_NAME_KEY @"PERSON_NAME_KEY"
#define ORDER_KEY @"ORDER_KEY"

@implementation RealManager



+(BOOL) needsInsertPerson{
    
    RLMResults<Person *> *person = [Person allObjects]; // retrieves all Dogs from the default Realm
    
    if(person.count==0){
        return true;
    }
    return false;
}

+(void) createDefaultPersons{
    
    NSArray *personArray = [self createPersonDictionary];
    
    for (NSDictionary *personDictionary in personArray ){
        Person *person = [Person new];
        person.name = [personDictionary valueForKey:PERSON_NAME_KEY];
        person.order = [[personDictionary valueForKey:ORDER_KEY] intValue];
        
        [self insertObjectInDataBase:person];
    }
    
}

+(NSArray*) createPersonDictionary{
    
    return [[NSArray alloc] initWithObjects:
            @{PERSON_NAME_KEY:@"Enrique",ORDER_KEY:@4},
            @{PERSON_NAME_KEY:@"Cristian",ORDER_KEY:@5},
            @{PERSON_NAME_KEY:@"Javier",ORDER_KEY:@1},
            @{PERSON_NAME_KEY:@"Carlos",ORDER_KEY:@2},
            @{PERSON_NAME_KEY:@"Alejandro",ORDER_KEY:@10},
            @{PERSON_NAME_KEY:@"Abismei",ORDER_KEY:@9},
            @{PERSON_NAME_KEY:@"Ignacio",ORDER_KEY:@8},
            @{PERSON_NAME_KEY:@"Luis",ORDER_KEY:@7},
            @{PERSON_NAME_KEY:@"Alonso",ORDER_KEY:@6},
            @{PERSON_NAME_KEY:@"Sergio",ORDER_KEY:@3},

            nil];
}


+(RLMResults*) getAllPerson{
    
    if([self needsInsertPerson]){
        [self createDefaultPersons];
    }
    
    return [self getAllPersonByAlpha] ;
}


+(void) insertObjectInDataBase:(RLMObject *) realmObject{
    
    RLMRealm *realm =[RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addObject:realmObject];
    [realm commitWriteTransaction];
}

+(RLMResults*) getAllPersonByOrder{
    
    RLMResults<Person *> *sortedPerson = [[Person objectsWhere:@"order !=0"]
                                                                      sortedResultsUsingProperty:@"order" ascending:YES];
    
    return sortedPerson;
}

+(RLMResults*) getAllPersonByAlpha{
    
    
    RLMResults<Person *> *sortedPerson = [[Person objectsWhere:@"order !=0"]
                                          sortedResultsUsingProperty:@"name" ascending:YES];
    
    return sortedPerson;
}

@end
