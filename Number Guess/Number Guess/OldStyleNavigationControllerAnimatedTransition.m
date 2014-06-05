//
//  OldStyleNavigationControllerAnimatedTransition.m
//  Created by Davide Di Stefano on 16/09/13.
//  Copyright (c) 2013 ReturnService. All rights reserved.
//
//
//  Dzamir/OldStyleNavigationControllerAnimatedTransition · GitHub. 2014.
//  Dzamir/OldStyleNavigationControllerAnimatedTransition · GitHub. [ONLINE]
//  Available at: https://github.com/Dzamir/OldStyleNavigationControllerAnimatedTransition.
//  [Accessed 26 May 2014].
//
//

#import "OldStyleNavigationControllerAnimatedTransition.h"

@implementation OldStyleNavigationControllerAnimatedTransition

/**---------------------------------------------------------------------------------------
* @name init
*  ---------------------------------------------------------------------------------------
*/

/** Initialises the OldStyleNavigationControllerAnimatedTransition defining the animation
to use as default for all view controllers.

@return Initialised OldStyleNavigationControllerAnimatedTransition object
*/

- (id)init {
    self = [super init];
    if (self) {
        _operation = UINavigationControllerOperationPush;
    }
    return self;
}
/**---------------------------------------------------------------------------------------
* @name transitionDuration
*  ---------------------------------------------------------------------------------------
*/

/** Gets the duration in which the animation should run (in seconds)

@param transitionContext
@return Animation duration (in seconds)
*/
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext; {
    return 0.35;
}

/**---------------------------------------------------------------------------------------
* @name animateTransition
*  ---------------------------------------------------------------------------------------
*/

/** Defines and controls a sliding style animation for pushing and popping view controllers
which mimics that of iOS6.  This style transition fully supports the use of clear view
backgrounds eliminating the transparent overlap effect of views

@param transitionContext
*/
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext; {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect screenFrame = fromViewController.view.frame;
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toViewController.view];
    CGFloat toStartX, fromEndX;

    if (_operation == UINavigationControllerOperationPush) {
        toStartX = screenFrame.size.width;
        fromEndX = -screenFrame.size.width;
    } else {
        toStartX = -screenFrame.size.width;
        fromEndX = screenFrame.size.width;
    }

    toViewController.view.frame = CGRectOffset(screenFrame, toStartX, 0);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^
            {
                toViewController.view.frame = screenFrame;
                fromViewController.view.frame = CGRectOffset(screenFrame, fromEndX, 0);
            }        completion:^(BOOL finished) {
        [fromViewController.view removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}


@end