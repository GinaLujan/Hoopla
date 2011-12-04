//
//  RecommendationTableViewCell.h
//  Hoopla
//
//  Created by Chris Bruce on 12/4/11.
//  Copyright (c) 2011 Diversion, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RecommendationTableViewCellDelegate;

@interface RecommendationTableViewCell : UITableViewCell {
    UITapGestureRecognizer *_favTapGesture;
    UITapGestureRecognizer *_infoTapGesture;
    BOOL _isStarred;
}

@property (weak) id <RecommendationTableViewCellDelegate>delegate;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, strong) IBOutlet UIImageView *favoriteImageView;

@property (nonatomic, strong) Recommendation *recommendation;

@property (nonatomic, strong) IBOutlet UIImageView *infoImageView;

- (IBAction)favoriteTapped:(id)sender;
- (IBAction)infoTapped:(id)sender;
- (void)toggleStar:(BOOL)isSelected;
@end

@protocol RecommendationTableViewCellDelegate <NSObject>

@optional

- (void)favoriteToggled:(BOOL)isSelected forRecommendation:(Recommendation *)recommendation;
- (void)infoSelected:(Recommendation *)recommendation;

@end
