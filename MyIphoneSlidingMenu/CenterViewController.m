//
//  CenterViewController.m
//  MyIphoneSlidingMenu
//
//  Created by qainfotech on 01/08/13.
//  Copyright (c) 2013 qainfotech. All rights reserved.
//

#import "CenterViewController.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}




-(void)btnMovePanelRight:(id)sender {
	UIBarButtonItem *button = sender;
	switch (button.tag) {
		case 0: {
            [_delegate movePanelRight];
            
			break;
		}
			
		case 1: {
			[_delegate movePanelToOriginalPosition];
			break;
		}
			
		default:
			break;
	}
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    self.navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    self.navBar.barStyle=UIBarStyleBlackOpaque;
    self.leftButton= [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:self action:@selector(btnMovePanelRight:)];
    UIBarButtonItem *right= [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStyleBordered target:self action:@selector(next)];
    
    
    UINavigationItem *navigationItem=[[UINavigationItem alloc]init];
    [navigationItem setLeftBarButtonItem:self.leftButton];
    [navigationItem setRightBarButtonItem:right];
    [self.navBar setItems:[NSArray arrayWithObject:navigationItem] animated:YES];
    [self.view addSubview:self.navBar];

    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 60, 320, 30)];
    label.text=@"Game OverView Screen";
    [self.view addSubview:label];
    

 

    
	// Do any additional setup after loading the view.
}


-(void)next
{
    AfterCenterViewController *next=[[AfterCenterViewController alloc]init];
    [self.navigationController pushViewController:next animated:YES];
}

- (void)menuItemSelected:(NSString *)detail close:(BOOL)close;
{
    NSLog(@"center%@",detail);
    
    
    if (close) {
        [_delegate movePanelToOriginalPosition];

    }

}

-(void)viewWillAppear:(BOOL)animated
{
   
    self.view.backgroundColor=[UIColor greenColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
