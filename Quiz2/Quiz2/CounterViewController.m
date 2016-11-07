//
//  CounterViewController.m
//  Quiz2
//
//  Created by Javier Hernandez on 5/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "CounterViewController.h"

@interface CounterViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblResultCounter;

@end

@implementation CounterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lblResultCounter.text = [NSString stringWithFormat:@"%@",[self.counterResult uppercaseString]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
