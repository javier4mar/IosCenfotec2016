//
//  APRoundedButton.h
//  MyCalculator
//
//  Created by Javier Hernandez on 4/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface APRoundedButton : UIButton

@property (nonatomic) IBInspectable BOOL    topLeft;
@property (nonatomic) IBInspectable BOOL    topRigth;
@property (nonatomic) IBInspectable BOOL    bottomLeft;
@property (nonatomic) IBInspectable BOOL    bottomRigth;
@property (nonatomic) IBInspectable int     cornerRadius;
@property (nonatomic) IBInspectable UIColor *fillColor;


@end
