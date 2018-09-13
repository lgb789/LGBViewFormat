//
//  LGBViewController.m
//  LGBViewFormat
//
//  Created by lgb789 on 09/06/2018.
//  Copyright (c) 2018 lgb789. All rights reserved.
//

#import "LGBViewController.h"

@interface LGBViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *data;
@end

@implementation LGBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    self.data = @[
                  @[@"UILabel", @"LGBLableExample"],
                  @[@"UIButton", @"LGBButtonExample"],
                  @[@"UITextView", @"LGBTextViewExample"],
                  @[@"UITextField", @"LGBTextFieldExample"],
                  @[@"Border", @"LGBBorderExample"],
                  @[@"TextViewPlaceHolder", @"LGBTextViewPlaceHolderController"],
                  ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    
    cell.textLabel.text = self.data[indexPath.row][0];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"index:%@", indexPath);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *controller = [NSClassFromString(self.data[indexPath.row][1]) new];
    [self.navigationController pushViewController:controller animated:YES];
    
}

@end
