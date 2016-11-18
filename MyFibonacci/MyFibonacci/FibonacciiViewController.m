//
//  FibonacciiViewController.m
//  MyFibonacci
//
//  Created by Javier Hernandez on 17/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "FibonacciiViewController.h"
#import "FibonacciiTableViewCell.h"

#import "Fibonaccii.h"


#define CUSTOM_CELL_IDENTIFIER @"FibonacciiTableViewCell"


@interface FibonacciiViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (nonatomic, strong)  NSMutableArray *mFibonaccii;

@end

@implementation FibonacciiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self RegisterCustomCell];

    self.mFibonaccii = [Fibonaccii getMyFibonaccii];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma -mark TABLE VIEW METHODS

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.mFibonaccii.count;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FibonacciiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_IDENTIFIER];
    
    Fibonaccii *num = self.mFibonaccii[indexPath.row];
    
    [cell setupCellWithFibonaccii:num];
    
    return cell;
}



- (void)RegisterCustomCell {
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_IDENTIFIER bundle:nil];
    [self.mTableView registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_IDENTIFIER];
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
