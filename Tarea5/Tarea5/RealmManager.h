//
//  RealmManager.h
//  Tarea5
//
//  Created by Javier Hernandez on 7/12/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
@class Dog;
@interface RealmManager : NSObject


+(RLMResults*) getAllDogs;
+(void) createDogWithName:(NSString*) dogName  dogColor:(NSString*)dogColor;
+(void) deleteDogInDataBase:(RLMObject *) realmObject;



@end
