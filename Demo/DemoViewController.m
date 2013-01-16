//
//  DemoViewController.m
//  DejalActivityView Demo
//
//  Created by David Sinclair on 2009-07-30.
//  Copyright 2009-2013 Dejal Systems, LLC. All rights reserved.
//

#import "DemoViewController.h"
#import "DejalActivityView.h"


@implementation DemoViewController

@synthesize textField, showAgainButton;
@synthesize useBezelStyle, useKeyboardStyle, showKeyboard, coverNavBar, useNetworkActivity, labelText1, labelText2, labelWidth;

- (void)viewDidLoad;
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    if (self.showKeyboard)
        [self.textField becomeFirstResponder];
    else
    {
        [self.textField resignFirstResponder];
        self.textField.hidden = YES;
    }
    
    if (self.useKeyboardStyle)
        self.showAgainButton.enabled = NO;
    else if (!self.useBezelStyle)
        self.showAgainButton.hidden = YES;
    
    [self performSelector:@selector(displayActivityView) withObject:nil afterDelay:0.8];
}

- (void)viewDidDisappear:(BOOL)animated;
{
	[super viewDidDisappear:animated];
    
    [self removeActivityView];
}

- (IBAction)displayActivityView;
{
    UIView *viewToUse = self.view;
    
    // Perhaps not the best way to find a suitable view to cover the navigation bar as well as the content?
    if (self.coverNavBar)
        viewToUse = self.navigationController.navigationBar.superview;
    
    if (self.useKeyboardStyle)
        self.showAgainButton.enabled = NO;
    else if (!self.useBezelStyle)
        self.showAgainButton.hidden = YES;
    
    if (self.labelText1)
    {
        // Display the appropriate activity style, with custom label text.  The width can be omitted or zero to use the text's width:
        if (self.useKeyboardStyle)
            [DejalKeyboardActivityView activityViewWithLabel:self.labelText1];
        else if (self.useBezelStyle)
            [DejalBezelActivityView activityViewForView:viewToUse withLabel:self.labelText1 width:self.labelWidth];
        else
            [DejalActivityView activityViewForView:viewToUse withLabel:self.labelText1 width:self.labelWidth];
    }
    else
    {
        // Display the appropriate activity style, with the default "Loading..." text:
        if (self.useKeyboardStyle)
            [DejalKeyboardActivityView activityView];
        else if (self.useBezelStyle)
            [DejalBezelActivityView activityViewForView:viewToUse];
        else
            [DejalActivityView activityViewForView:viewToUse];
    }
    
    // If this is YES, the network activity indicator in the status bar is shown, and automatically hidden when the activity view is removed.  This property can be toggled on and off as needed:
    if (self.useNetworkActivity)
        [DejalActivityView currentActivityView].showNetworkActivityIndicator = YES;
    
    if (self.labelText2)
        [self performSelector:@selector(changeActivityView) withObject:nil afterDelay:3.0];
    else
        [self performSelector:@selector(removeActivityView) withObject:nil afterDelay:5.0];
}

- (void)changeActivityView;
{
    // Change the label text for the currently displayed activity view:
    [DejalActivityView currentActivityView].activityLabel.text = self.labelText2;
    
    // Disable the network activity indicator in the status bar, e.g. after downloading data and starting parsing it (don't have to disable it if simply removing the view):
    if (self.useNetworkActivity)
        [DejalActivityView currentActivityView].showNetworkActivityIndicator = NO;
    
    [self performSelector:@selector(removeActivityView) withObject:nil afterDelay:3.0];
}

- (void)removeActivityView;
{
    // Remove the activity view, with animation for the two styles that support it:
    if (self.useKeyboardStyle)
        [DejalKeyboardActivityView removeViewAnimated:YES];
    else if (self.useBezelStyle)
        [DejalBezelActivityView removeViewAnimated:YES];
    else
        [DejalActivityView removeView];
    
    self.showAgainButton.enabled = YES;
    self.showAgainButton.hidden = NO;
    
    [[self class] cancelPreviousPerformRequestsWithTarget:self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
{
    // All orientations are supported by the activity view:
    return YES;
}

- (void)didReceiveMemoryWarning;
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

@end

