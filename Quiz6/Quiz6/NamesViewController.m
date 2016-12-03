//
//  NamesViewController.m
//  Quiz6
//
//  Created by Javier Hernandez on 3/12/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "NamesViewController.h"
#import "PersonTableViewCell.h"

#import "RealManager.h"

#define CUSTOM_CELL_ID @"PersonTableViewCell"

@interface NamesViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mTablePerson;
@property  RLMResults *personArray;

@end

@implementation NamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCell];
    [self initializePersonArray];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initializePersonArray{
    
    self.personArray = [RealManager getAllPerson];
    
}


-(void)registerCell{
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_ID bundle:nil];
    [self.mTablePerson registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_ID];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.personArray.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_ID];
    Person *personToShow = self.personArray[indexPath.row];
    [cell setupCellWithPersonObject:personToShow];
    return cell;
}


- (IBAction)orderMyList:(id)sender {
    
    self.personArray = [RealManager getAllPersonByOrder];
    
    [self.mTablePerson reloadData];

}
- (IBAction)randomMyList:(id)sender {
    
        self.personArray = [RealManager getAllPersonByAlpha];
    
    [self.mTablePerson reloadData];

}











@end
