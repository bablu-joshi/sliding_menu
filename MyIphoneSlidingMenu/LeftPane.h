//
//  LeftPane.h
//  MyIphoneSlidingMenu
//
//  Created by qainfotech on 01/08/13.
//  Copyright (c) 2013 qainfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NextLeftViewController.h"

@protocol LeftPanelViewControllerDelegate <NSObject>
@required
- (void)menuItemSelected:(NSString *)detail close:(BOOL)close;
@end

@interface LeftPane : UITableViewController
@property (nonatomic, assign) id<LeftPanelViewControllerDelegate> delegate;

@end