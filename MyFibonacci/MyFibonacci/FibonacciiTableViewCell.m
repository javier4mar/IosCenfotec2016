//
//  FibonacciiTableViewCell.m
//  MyFibonacci
//
//  Created by Javier Hernandez on 17/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "FibonacciiTableViewCell.h"
#import "Fibonaccii.h"

@interface FibonacciiTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *mLblFibonaccii;

@end

@implementation FibonacciiTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.mLblFibonaccii.numberOfLines = 1;
    self.mLblFibonaccii.minimumFontSize = 8;
    self.mLblFibonaccii.adjustsFontSizeToFitWidth = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupCellWithFibonaccii:(Fibonaccii*)fibonacci{
    // self.ivImage.image = category.imageName;
    self.mLblFibonaccii.text = fibonacci.number;
    
}

@end
