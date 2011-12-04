//
//  LoadingView.m
//  Hoopla
//
//  Created by Chris Bruce on 12/4/11.
//  Copyright (c) 2011 Diversion, Inc. All rights reserved.
//

#import "LoadingView.h"
#import <QuartzCore/QuartzCore.h>

@implementation LoadingView

- (id)init {
    if ((self = [self initWithFrame:CGRectMake(30, 50, 100, 100)])) {
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _spinnerImageView = [[UIImageView alloc] initWithImage:[UIImage animatedImageNamed:@"Loading" duration:1.0f]];

        _spinnerImageView.frame = self.frame;
        _spinnerImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:_spinnerImageView];
        self.layer.cornerRadius = 15;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        self.opaque = NO;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
