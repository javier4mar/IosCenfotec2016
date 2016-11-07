//
//  InputViewController.m
//  Quiz2
//
//  Created by Javier Hernandez on 5/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "InputViewController.h"
#import "CounterViewController.h"

@interface InputViewController ()
@property (weak, nonatomic) IBOutlet UITextField *etWord;

@end

@implementation InputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)counterWord:(id)sender {
    
    if ([self.etWord.text isEqual:@""]){
    
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSString *title = @"Error";
            NSString *message  = @"El Campo no puede ser vacio";
            
            UIAlertController *alert = [UIAlertController
                                        alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *yesButton = [UIAlertAction actionWithTitle:@"Ok" style: UIAlertActionStyleDefault  handler:^(UIAlertAction *action) {
                
                
                [alert dismissViewControllerAnimated:YES completion:nil];
                
            }];
            
            [alert addAction:yesButton];
            [self presentViewController:alert animated:YES completion:nil];
            
            
        });

    }else{
        
        CounterViewController *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CounterViewController"];
        [self.etWord.text length];
        
        nextViewController.counterResult =[NSString stringWithFormat:@"# %lu",[self.etWord.text length]];
        
        [self.navigationController pushViewController:nextViewController animated:YES];
        
       
        
        
    }
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
