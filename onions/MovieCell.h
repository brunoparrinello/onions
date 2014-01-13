//
//  MovieCell.h
//  onions
//
//  Created by Bruno Parrinello on 1/7/14.
//  Copyright (c) 2014 Bruno Parrinello. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *posterImageView;
@property (nonatomic, weak) IBOutlet UILabel *movieTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *movieSummaryLabel;
@property (nonatomic, weak) IBOutlet UILabel *movieCastLabel;

@end
