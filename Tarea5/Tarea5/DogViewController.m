//
//  DogViewController.m
//  Tarea5
//
//  Created by Javier Hernandez on 7/12/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "DogViewController.h"
#import "RealmManager.h"
#import "DogTableViewCell.h"
#import "AddTableViewController.h"


#define CUSTOM_CELL_ID @"DogTableViewCell"

@interface DogViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mTableDog;
@property  RLMResults *dogArray;

@end

@implementation DogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Dog";

    [self registerCell];
    [self initializeDogArray];
    [self createAddDogUIBarButtonItem];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    [self initializeDogArray];
    [self.mTableDog reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initializeDogArray{
    
    self.dogArray = [RealmManager getAllDogs];
    
}

-(void)createAddDogUIBarButtonItem{
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem)];
    self.navigationItem.rightBarButtonItem = addItem;
}

-(void)addItem{
    AddTableViewController *addNewsTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddTableViewController"];
    [self.navigationController pushViewController:addNewsTableViewController
                                         animated:YES];
}

#pragma mark - TableViewDogs

-(void)registerCell{
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_ID bundle:nil];
    [self.mTableDog registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_ID];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dogArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_ID];
    Dog *dogToShow = self.dogArray[indexPath.row];
    [cell setupCellWithDogObject:dogToShow];
    return cell;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        if(self.dogArray){
            RLMObject *dog = self.dogArray[indexPath.row];
            [RealmManager deleteDogInDataBase:dog];
        }
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
@end
