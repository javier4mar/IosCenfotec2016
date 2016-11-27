//
//  MultiplyViewController.m
//  Quiz5
//
//  Created by Javier Hernandez on 26/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "MultiplyViewController.h"
#import "MultiplyTableViewCell.h"
#import "Number.h"

#define CUSTOM_CELL_IDENTIFIER @"MultiplyTableViewCell"

@interface MultiplyViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tfNumber;
@property (weak, nonatomic) IBOutlet UITableView *mTableNumber;

@end

@implementation MultiplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self RegisterCustomCell];
     self.tableResult = [Number getMyMultiply:1];
    
}


- (IBAction)getMultiplyTable:(id)sender {
    
    
    if([self.tfNumber.text intValue]){
        self.tableResult = [Number getMyMultiply:[self.tfNumber.text intValue] ];

        [self.mTableNumber reloadData];

    }else{
        [self messageDialog];
        self.tfNumber.text=@"";
    }
    
}

-(void) messageDialog{
    NSString *title = @"Error";
    NSString *message  = @"Por favor ingresa solo numeros";
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        
        UIAlertController *alert = [UIAlertController
                                    alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *yesButton = [UIAlertAction actionWithTitle:@"Ok" style: UIAlertActionStyleDefault  handler:^(UIAlertAction *action) {
            
            
            [alert dismissViewControllerAnimated:YES completion:nil];
            
        }];
        
        [alert addAction:yesButton];
        [self presentViewController:alert animated:YES completion:nil];
        
        
    });
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.tableResult.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
         MultiplyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_IDENTIFIER];
    
    Number* row = nil;
    
    if(self.tableResult){
        row = self.tableResult[indexPath.row];
        
        [cell setupCellWithMultiply:row];
        
    }
 
    
    return cell;
    
}

- (void)RegisterCustomCell {
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_IDENTIFIER bundle:nil];
    [self.mTableNumber registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_IDENTIFIER];
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
