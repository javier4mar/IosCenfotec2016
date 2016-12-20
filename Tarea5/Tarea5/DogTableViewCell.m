//
//  DogTableViewCell.m
//  Tarea5
//
//  Created by Javier Hernandez on 7/12/16.
//  Copyright © 2016 Sidekicks. All rights reserved.
//

#import "DogTableViewCell.h"
#import "Dog.h"

@interface DogTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *ivDogImage;
@property (weak, nonatomic) IBOutlet UILabel *lblDogName;
@property (weak, nonatomic) IBOutlet UILabel *lblDogColor;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;


@end

@implementation DogTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupCellWithDogObject:(Dog*)dog{
    self.lblDogName.text =dog.name;
    self.lblDogColor.text = dog.color;
    self.ivDogImage.image = [UIImage imageNamed:dog.imageDog];
    self.lblDate.text = [NSString stringWithFormat:@"%@", dog.createdDate];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


@end
