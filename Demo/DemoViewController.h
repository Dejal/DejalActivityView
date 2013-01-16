//
//  DemoViewController.h
//  DejalActivityView Demo
//
//  Created by David Sinclair on 2009-07-30.
//  Copyright 2009-2013 Dejal Systems, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DemoViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UIButton *showAgainButton;

@property (nonatomic) BOOL useBezelStyle;
@property (nonatomic) BOOL useKeyboardStyle;
@property (nonatomic) BOOL showKeyboard;
@property (nonatomic) BOOL coverNavBar;
@property (nonatomic) BOOL useNetworkActivity;
@property (nonatomic, strong) NSString *labelText1;
@property (nonatomic, strong) NSString *labelText2;
@property (nonatomic) NSUInteger labelWidth;

- (IBAction)displayActivityView;
- (void)changeActivityView;
- (void)removeActivityView;

@end

