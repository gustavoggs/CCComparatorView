//
//  CCComparatorView.h
//
//  Created by Gustavo Grana on 7/3/12.
//

#import "CCComparatorView.h"

@implementation CCComparatorView

- (id)initWithCoder:(NSCoder *)aDecoder {

    self = [super initWithCoder:aDecoder];
    if (self) {
        UIView* touchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAlphaChange:)];
        [pan setMaximumNumberOfTouches:1];
        UIPanGestureRecognizer* panRemove = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRemove:)];

        [panRemove setMinimumNumberOfTouches:2];
        
        [self setBackgroundColor:[UIColor clearColor]];
        [touchView addGestureRecognizer:panRemove];
        [touchView addGestureRecognizer:pan];
        [self addSubview:touchView];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self) {
        UIView* touchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAlphaChange:)];
        [pan setMaximumNumberOfTouches:1];
        UIPanGestureRecognizer* panRemove = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRemove:)];
        
        [panRemove setMinimumNumberOfTouches:2];
        
        [self setBackgroundColor:[UIColor clearColor]];
        [touchView addGestureRecognizer:panRemove];
        [touchView addGestureRecognizer:pan];
        [self addSubview:touchView];
        
    }
    return self;
}

- (void) gestureAlphaChange:(UIPanGestureRecognizer*)pan {

    CGPoint velocity = [pan velocityInView:self];
    if (velocity.y < 0) {
        self.alpha = self.alpha == 1 ? 1 : self.alpha + 0.01;
    } else {        
        self.alpha = self.alpha < 0.05 ? 0.05 : self.alpha - 0.01;
    }
}

- (void) gestureRemove:(UIPanGestureRecognizer*)pan {
    self.alpha = 0;
}

@end
