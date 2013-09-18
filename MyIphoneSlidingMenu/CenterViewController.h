//
//  CenterViewController.h
//  MyIphoneSlidingMenu
//
//  Created by qainfotech on 01/08/13.
//  Copyright (c) 2013 qainfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftPane.h"
#import "AfterCenterViewController.h"

@protocol CenterViewControllerDelegate <NSObject>
@optional
- (void)movePanelRight;
@required
- (void)movePanelToOriginalPosition;
@end


@interface CenterViewController : UIViewController<LeftPanelViewControllerDelegate>

@property (nonatomic, assign) id<CenterViewControllerDelegate,LeftPanelViewControllerDelegate> delegate;

@property (nonatomic,strong) UIBarButtonItem *leftButton;
@property(nonatomic,strong) UINavigationBar *navBar;

@end
