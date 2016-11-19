//
//  ColorNumbersViewController.m
//  Quiz4
//
//  Created by Javier Hernandez on 19/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "ColorNumbersViewController.h"
#import "Numbers.h"
#import "NumberTableViewCell.h"

#define CUSTOM_CELL_IDENTIFIER @"NumberTableViewCell"

@interface ColorNumbersViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (nonatomic, strong)  NSMutableArray *mNumberList;

@end

@implementation ColorNumbersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self RegisterCustomCell];
    
    self.mNumberList = [Numbers getMyNumbers];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma -mark TABLE VIEW METHODS

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.mNumberList.count;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NumberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_IDENTIFIER];
    
    Numbers *num = self.mNumberList[indexPath.row];
    
    [cell setupCellWithNumber:num];
    
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
