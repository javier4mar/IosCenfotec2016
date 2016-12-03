//
//  PersonTableViewCell.m
//  Quiz6
//
//  Created by Javier Hernandez on 3/12/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "PersonTableViewCell.h"
#import "Person.h"

@interface PersonTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblNamePerson;

@property (weak, nonatomic) IBOutlet UILabel *lblOrderPerson;

@end

@implementation PersonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupCellWithPersonObject:(Person*)person{
    self.lblNamePerson.text = person.name;
    self.lblOrderPerson.text = [NSString stringWithFormat:@"%d",person.order];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


@end
