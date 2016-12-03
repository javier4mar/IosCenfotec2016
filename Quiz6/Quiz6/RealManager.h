//
//  RealManager.h
//  Quiz6
//
//  Created by Javier Hernandez on 3/12/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface RealManager : NSObject

+(RLMResults*) getAllPerson;
+(RLMResults*) getAllPersonByOrder;
+(RLMResults*) getAllPersonByAlpha;


@end
