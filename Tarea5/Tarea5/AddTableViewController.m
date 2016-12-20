//
//  AddTableViewController.m
//  Tarea5
//
//  Created by Javier Hernandez on 7/12/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "AddTableViewController.h"
#import "RealmManager.h"


@interface AddTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfDogName;
@property (weak, nonatomic) IBOutlet UITextField *tfDogColor;

@end

@implementation AddTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSaveUIBarButtonItem];
}

- (IBAction)saveDogInformation:(id)sender {
    [self saveDog];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) saveDog{
    if(![self.tfDogName.text isEqualToString:@"" ] && ![self.tfDogColor.text isEqualToString:@""]){
        [RealmManager createDogWithName:self.tfDogName.text dogColor:self.tfDogColor.text];
        
        self.tfDogName.text=@"";
        self.tfDogColor.text=@"";
        
        [self.navigationController popViewControllerAnimated:YES];

    }
}

-(void)addSaveUIBarButtonItem{
    UIBarButtonItem *saveBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveDog)];
    self.navigationItem.rightBarButtonItem = saveBarButtonItem;
}


@end
