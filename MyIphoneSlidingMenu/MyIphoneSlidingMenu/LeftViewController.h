//
//  LeftViewController.h
//  MyIphoneSlidingMenu
//
//  Created by qainfotech on 01/08/13.
//  Copyright (c) 2013 qainfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftPane.h"
#import "CenterViewController.h"


@interface LeftViewController : UIViewController
@property(nonatomic,strong)LeftPane *leftPane;
@property(nonatomic,strong)UINavigationController *leftMenuRootNavigation;
@end
