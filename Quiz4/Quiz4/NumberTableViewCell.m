//
//  NumberTableViewCell.m
//  Quiz4
//
//  Created by Javier Hernandez on 19/11/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "NumberTableViewCell.h"
#import "Numbers.h"

@interface NumberTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *mlblNumber;


@end

@implementation NumberTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.mlblNumber.numberOfLines = 1;
    self.mlblNumber.adjustsFontSizeToFitWidth = YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setupCellWithNumber:(Numbers*)num{
    // self.ivImage.image = category.imageName;
    self.mlblNumber.text = num.number;
    
    if(num.par){
          [self setBackgroundColor:[UIColor redColor]];
    }else{
           [self setBackgroundColor:[UIColor blueColor]];
    }


    
}


@end
