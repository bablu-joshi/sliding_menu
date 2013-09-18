//
//  LeftViewController.m
//  MyIphoneSlidingMenu
//
//  Created by qainfotech on 01/08/13.
//  Copyright (c) 2013 qainfotech. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   self.leftPane=[[LeftPane alloc]initWithStyle:UITableViewStylePlain];
   self.leftMenuRootNavigation=[[UINavigationController alloc]initWithRootViewController:self.leftPane];
    [self.view addSubview:self.leftMenuRootNavigation.view];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
