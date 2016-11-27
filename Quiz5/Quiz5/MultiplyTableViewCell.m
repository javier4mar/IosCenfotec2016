//
//  MultiplyTableViewCell.m
//  Quiz5
//
//  Created by Javier Hernandez on 26/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "MultiplyTableViewCell.h"
#import "Number.h"

@interface MultiplyTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *mMultiplyResult;


@end

@implementation MultiplyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setupCellWithMultiply:(Number*)number{

    self.mMultiplyResult.text =[NSString stringWithFormat:@"%@ %@ %@ %@ %@",number.number,@"x", number.multiply,@"=",number.result];
    
}


@end
