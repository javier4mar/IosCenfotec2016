//
//  CalculatorViewController.m
//  MyCalculator
//
//  Created by Javier Hernandez on 4/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "CalculatorViewController.h"

#import "JJMaterialTextfield.h"
#import "AFViewShaker.h"
#import "APRoundedButton.h"
#import "ResultViewController.h"

@interface CalculatorViewController ()
@property (weak, nonatomic) IBOutlet JJMaterialTextfield *etNumberOne;
@property (weak, nonatomic) IBOutlet JJMaterialTextfield *etNumberTwo;

@end

@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"operation"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    _etNumberOne.textColor=[UIColor whiteColor];
    _etNumberOne.enableMaterialPlaceHolder = YES;
    _etNumberOne.errorColor=[UIColor redColor];
    _etNumberOne.lineColor=[UIColor whiteColor];
    _etNumberOne.tintColor=[UIColor whiteColor];
    _etNumberOne.placeholder=@"Ingrese un numero";
    _etNumberOne.returnKeyType=UIReturnKeyNext;

    _etNumberOne.tag=1;
    
    
    _etNumberTwo.textColor=[UIColor whiteColor];
    _etNumberTwo.enableMaterialPlaceHolder = YES;
    _etNumberTwo.errorColor=[UIColor redColor];
    _etNumberTwo.lineColor=[UIColor whiteColor];
    _etNumberTwo.tintColor=[UIColor whiteColor];
    _etNumberTwo.placeholder=@"Ingrese otro numero";
    _etNumberTwo.returnKeyType=UIReturnKeyDone;
    _etNumberTwo.tag=2;
    
    
}

#pragma OPERATION BUTTONS
- (IBAction)sumNumbers:(id)sender {
    
    if([self validateString:self.etNumberOne.text withPattern:@"^[0-9]+$"] && [self validateString:self.etNumberTwo.text withPattern:@"^[0-9]+$"]){
        
        ResultViewController *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultViewController"];
        
        
        NSNumber *total = [NSNumber numberWithFloat:([self.etNumberOne.text doubleValue] + [self.etNumberTwo.text doubleValue])];
        
        
        nextViewController.operationResult = @"Suma";
        nextViewController.numberResult = [NSString stringWithFormat:@"%@",total] ;
        

        [self.navigationController pushViewController:nextViewController animated:YES];

        [self.etNumberOne hideError];
        [self.etNumberTwo hideError];
        
    }else{
        [self messageDialog];

        if(![self validateString:self.etNumberOne.text withPattern:@"^[0-9]+$"]){
            [self.etNumberOne showError];

        }else{
            [self.etNumberOne hideError];

        }
        if(![self validateString:self.etNumberTwo.text withPattern:@"^[0-9]+$"]){
            [self.etNumberTwo showError];
            
        }else{
            [self.etNumberTwo hideError];

        }
        
    }

    
}
- (IBAction)subtractNumbers:(id)sender {
    
    if([self validateString:self.etNumberOne.text withPattern:@"^[0-9]+$"] && [self validateString:self.etNumberTwo.text withPattern:@"^[0-9]+$"]){
        
        ResultViewController *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultViewController"];
        
        
        NSNumber *total = [NSNumber numberWithFloat:([self.etNumberOne.text doubleValue] - [self.etNumberTwo.text doubleValue])];
        
        
        nextViewController.operationResult = @"Resta";
        nextViewController.numberResult = [NSString stringWithFormat:@"%@",total] ;
        
   [self.navigationController pushViewController:nextViewController animated:YES];
        
    }else{
        [self messageDialog];

        if(![self validateString:self.etNumberOne.text withPattern:@"^[0-9]+$"]){
            [self.etNumberOne showError];
            
        }else{
            [self.etNumberOne hideError];
            
        }
        if(![self validateString:self.etNumberTwo.text withPattern:@"^[0-9]+$"]){
            [self.etNumberTwo showError];
            
        }else{
            [self.etNumberTwo hideError];
            
        }
        
    }
}
- (IBAction)multiplyNumbers:(id)sender {
    if([self validateString:self.etNumberOne.text withPattern:@"^[0-9]+$"] && [self validateString:self.etNumberTwo.text withPattern:@"^[0-9]+$"]){
        
        ResultViewController *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultViewController"];
        
        
        NSNumber *total = [NSNumber numberWithFloat:([self.etNumberOne.text doubleValue] * [self.etNumberTwo.text doubleValue])];

        
        nextViewController.operationResult = @"Multiplicacion";
        nextViewController.numberResult = [NSString stringWithFormat:@"%@",total] ;

       
        
        [self.navigationController pushViewController:nextViewController animated:YES];
        
        [self.etNumberOne hideError];
        [self.etNumberTwo hideError];
        
    }else{
        [self messageDialog];
 
        if(![self validateString:self.etNumberOne.text withPattern:@"^[0-9]+$"]){
            [self.etNumberOne showError];
            
        }else{
            [self.etNumberOne hideError];
            
        }
        if(![self validateString:self.etNumberTwo.text withPattern:@"^[0-9]+$"]){
            [self.etNumberTwo showError];
            
        }else{
            [self.etNumberTwo hideError];
            
        }
        
    }
}

- (IBAction)divideNumbers:(id)sender {
    
    if([self validateString:self.etNumberOne.text withPattern:@"^[0-9]+$"] && [self validateString:self.etNumberTwo.text withPattern:@"^[0-9]+$"]){
        
        if([self.etNumberTwo.text isEqualToString:@"0"]){
            [self ceroDivision];
            
            
        }else{
            ResultViewController *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultViewController"];
            
            
            NSNumber *total = [NSNumber numberWithFloat:([self.etNumberOne.text doubleValue] / [self.etNumberTwo.text doubleValue])];
            
            
            nextViewController.operationResult = @"Division";
            nextViewController.numberResult = [NSString stringWithFormat:@"%@",total] ;
            
               [self.navigationController pushViewController:nextViewController animated:YES];
        }
        
       
        
    }else{
        
        [self messageDialog];
        if(![self validateString:self.etNumberOne.text withPattern:@"^[0-9]+$"]){
            [self.etNumberOne showError];
            
        }else{
            [self.etNumberOne hideError];
            
        }
        if(![self validateString:self.etNumberTwo.text withPattern:@"^[0-9]+$"]){
            [self.etNumberTwo showError];
            
        }else{
            [self.etNumberTwo hideError];
            
        }
        
    }

}

- (BOOL)validateString:(NSString *)string withPattern:(NSString *)pattern
{
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSAssert(regex, @"Unable to create regular expression");
    
    NSRange textRange = NSMakeRange(0, string.length);
    NSRange matchRange = [regex rangeOfFirstMatchInString:string options:NSMatchingReportProgress range:textRange];
    
    BOOL didValidate = NO;
    
    // Did we find a matching range
    if (matchRange.location != NSNotFound)
        didValidate = YES;
    
    return didValidate;
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

-(void) ceroDivision{
    NSString *title = @"Error";
    NSString *message  = @"La division no puede ser por 0";
    
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
