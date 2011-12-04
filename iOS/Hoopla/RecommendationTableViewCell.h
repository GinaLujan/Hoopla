//
//  RecommendationTableViewCell.h
//  Hoopla
//
//  Created by Chris Bruce on 12/4/11.
//  Copyright (c) 2011 Diversion, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FavoriteToggledDelegate;

@interface RecommendationTableViewCell : UITableViewCell {
    UITapGestureRecognizer *_favTapGestrure;
    BOOL _isStarred;
}

@property (weak) id <FavoriteToggledDelegate>delegate;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, strong) IBOutlet UIImageView *favoriteImageView;

@property (nonatomic, strong) Recommendation *recommendation;

- (IBAction)favoriteTapped:(id)sender;
- (void)toggleStar:(BOOL)isSelected;
@end

@protocol FavoriteToggledDelegate <NSObject>

@optional

- (void)favoriteToggled:(BOOL)isSelected;

@end
