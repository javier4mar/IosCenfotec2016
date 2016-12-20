//
//  RealmManager.m
//  Tarea5
//
//  Created by Javier Hernandez on 7/12/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "RealmManager.h"
#import <Realm/Realm.h>
#import "Dog.h"

#define IMAGE_NAME_KEY @"IMAGE_NAME_KEY"
#define INDEX_NAME_KEY @"INDEX_NAME_KEY"

@implementation RealmManager


+(RLMResults*) getAllDogs{

    return [Dog allObjects] ;
}


+(void) insertObjectInDataBase:(RLMObject *) realmObject{
    
    RLMRealm *realm =[RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addObject:realmObject];
    [realm commitWriteTransaction];
}

+(void) deleteDogInDataBase:(RLMObject *) realmObject{
    
    RLMRealm *realm =[RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm deleteObject:realmObject];
    [realm commitWriteTransaction];
}



+(void) createDogWithName:(NSString*) dogName  dogColor:(NSString*)dogColor{
    

    Dog *dog =[Dog new];
    dog.name = dogName;
    dog.imageDog = [self getImageDog];
    dog.color = dogColor;
    dog.createdDate = [NSDate date];
    
    [self insertObjectInDataBase:dog];
    
}



+(NSString*)getImageDog{
    
    NSArray* images = [self getListDogImages];
    int r = arc4random_uniform(12) % 100;

    return [[images objectAtIndex:r] objectForKey:IMAGE_NAME_KEY];
}

+(NSArray*) getListDogImages{
    
    return [[NSArray alloc] initWithObjects:
            @{INDEX_NAME_KEY:@"0",IMAGE_NAME_KEY:@"dog1"},
            @{INDEX_NAME_KEY:@"1",IMAGE_NAME_KEY:@"dog2"},
            @{INDEX_NAME_KEY:@"2",IMAGE_NAME_KEY:@"dog3"},
            @{INDEX_NAME_KEY:@"3",IMAGE_NAME_KEY:@"dog4"},
            @{INDEX_NAME_KEY:@"4",IMAGE_NAME_KEY:@"dog5"},
            @{INDEX_NAME_KEY:@"5",IMAGE_NAME_KEY:@"dog6"},
            @{INDEX_NAME_KEY:@"6",IMAGE_NAME_KEY:@"dog7"},
            @{INDEX_NAME_KEY:@"7",IMAGE_NAME_KEY:@"dog8"},
            @{INDEX_NAME_KEY:@"8",IMAGE_NAME_KEY:@"dog9"},
            @{INDEX_NAME_KEY:@"9",IMAGE_NAME_KEY:@"dog10"},
            @{INDEX_NAME_KEY:@"10",IMAGE_NAME_KEY:@"dog11"},
            @{INDEX_NAME_KEY:@"11",IMAGE_NAME_KEY:@"dog12"},
            nil];
}


@end
