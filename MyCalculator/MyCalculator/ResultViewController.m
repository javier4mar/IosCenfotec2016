//
//  ResultViewController.m
//  MyCalculator
//
//  Created by Javier Hernandez on 6/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblOperation;
@property (weak, nonatomic) IBOutlet UILabel *lblResult;

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"result"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    self.lblOperation.text = self.operationResult;
    self.lblResult.text = self.numberResult;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}


@end
