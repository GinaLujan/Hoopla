//
//  RecommendationTableViewCell.m
//  Hoopla
//
//  Created by Chris Bruce on 12/4/11.
//  Copyright (c) 2011 Diversion, Inc. All rights reserved.
//

#import "RecommendationTableViewCell.h"

@implementation RecommendationTableViewCell
@synthesize titleLabel;
@synthesize subtitleLabel;
@synthesize favoriteImageView;

@synthesize recommendation = _recommendation;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tablecellbg"]];
    UIView *bgView = [[UIView alloc] initWithFrame:self.frame];
    bgView.backgroundColor = UI_COLOR_PRIMARY;
    [bgView addSubview:imageView];
    self.backgroundView = bgView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setRecommendation:(Recommendation *)recommendation {
    if (_recommendation != recommendation) {
        _recommendation = recommendation;
        
        self.titleLabel.text = recommendation.title;
        self.subtitleLabel.text = [NSString stringWithFormat:@"%@ %@", recommendation.type, recommendation.subtitle];
        
        if (recommendation.isFavorite) {
            self.favoriteImageView.image = [UIImage imageNamed:@"suggestionstar-selected"];
        } else {
            self.favoriteImageView.image = [UIImage imageNamed:@"suggestionstar-unselected"];
        }
    }
}

@end
