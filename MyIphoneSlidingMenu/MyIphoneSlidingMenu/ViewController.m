//
//  ViewController.m
//  MyIphoneSlidingMenu
//
//  Created by qainfotech on 01/08/13.
//  Copyright (c) 2013 qainfotech. All rights reserved.
//

#import "ViewController.h"

#define CENTER_TAG 1
#define LEFT_PANEL_TAG 2
#define RIGHT_PANEL_TAG 3

#define CORNER_RADIUS 4

#define SLIDE_TIMING .25
#define PANEL_WIDTH 80

@interface ViewController ()
@property (nonatomic, strong) CenterViewController *centerViewController;
@property (nonatomic, strong) LeftViewController *leftPanelViewController;
@property (nonatomic, assign) BOOL showingLeftPanel;
@property (nonatomic, assign) BOOL showingRightPanel;
@property (nonatomic, assign) BOOL showPanel;
@property (nonatomic, assign) CGPoint preVelocity;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    self.title=@"viewContainer";
    
    self.centerViewController =[[CenterViewController alloc]init];
    self.centerViewController.view.frame= CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
	self.centerViewController.view.tag = CENTER_TAG;
	self.centerViewController.delegate = (id)self;
    [self.view addSubview:self.centerViewController.view];
	[self addChildViewController:self.centerViewController];
	[self.centerViewController didMoveToParentViewController:self];
    
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)showLeftView
{
    self.leftPanelViewController =[[LeftViewController alloc]init];
    self.leftPanelViewController.view.frame= CGRectMake(0, 0,self.view.frame.size.width - PANEL_WIDTH, self.view.frame.size.height);
	self.leftPanelViewController.view.tag = LEFT_PANEL_TAG;
   // self.leftPanelViewController.leftPane.delegate=self ;

    self.leftPanelViewController.leftPane.delegate=self.centerViewController ;

    
    [self.view addSubview:self.leftPanelViewController.view];
	[self addChildViewController:self.leftPanelViewController];
	[self.leftPanelViewController didMoveToParentViewController:self];
    
    
}

-(void)movePanelRight {
	[UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.centerViewController.view.frame = CGRectMake(self.view.frame.size.width - PANEL_WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height);

    }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [self showLeftView];
                             self.centerViewController.leftButton.tag = 1;
                         }
                     }];
}

-(void)movePanelToOriginalPosition {
	[UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.centerViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self resetMainView];

    }
     
                     completion:^(BOOL finished) {
                         if (finished) {
                             self.centerViewController.leftButton.tag = 0;
                         }
                     }];
}

-(void)resetMainView {
	// remove left and right views, and reset variables, if needed
	if (self.leftPanelViewController != nil) {
		[self.leftPanelViewController.view removeFromSuperview];
		self.leftPanelViewController = nil;
		self.centerViewController.leftButton.tag = 0;
		self.showingLeftPanel = NO;
	}
    }

-(void)viewWillAppear:(BOOL)animated
{
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
