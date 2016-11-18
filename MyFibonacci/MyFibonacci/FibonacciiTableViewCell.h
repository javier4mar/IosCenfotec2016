//
//  FibonacciiTableViewCell.h
//  MyFibonacci
//
//  Created by Javier Hernandez on 17/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Fibonaccii;
@interface FibonacciiTableViewCell : UITableViewCell


-(void)setupCellWithFibonaccii:(Fibonaccii*)fibonacci;

@end
