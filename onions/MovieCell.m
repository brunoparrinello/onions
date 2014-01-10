//
//  MovieCell.m
//  onions
//
//  Created by Bruno Parrinello on 1/7/14.
//  Copyright (c) 2014 Bruno Parrinello. All rights reserved.
//

#import "MovieCell.h"

@interface MovieCell ()

@property (nonatomic, weak) IBOutlet UIImageView *posterImageView;
@property (nonatomic, weak) IBOutlet UILabel *movieTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *movieSummaryLabel;
@property (nonatomic, weak) IBOutlet UILabel *movieCastLabel;


@end

@implementation MovieCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
