//
//  ListUserViewController.m
//  RealTimeReq
//
//  Created by admin on 3/30/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "ListUserViewController.h"
#import "ListUserViewCell.h"
#import "ItemRecord.h"

@implementation ListUserViewController
{
    NSTimer * timer;
    double timerInterval;

}
@synthesize arrList;

@dynamic tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
     self.title =@"List User";
   [self loadData];
    
    timerInterval = 2.0f;
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationItem setHidesBackButton:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];

}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [timer invalidate];
}
- (NSTimer *) timer {
    if (!timer) {
        timer = [NSTimer timerWithTimeInterval:timerInterval target:self selector:@selector(targetMethod) userInfo:nil repeats:YES];
    }
    return timer;
}
-(void)targetMethod{
 [self loadData];
}

-(void)loadData {
    static bool check = true;
    if (check) {
         [self showMBProcess];
    }
   
     ShareData *shared = [ShareData instance];
    [shared.userProxy getListUsers:^(id result, NSString *errorCode, NSString *message) {
        if ([result count] >0) {
            self.arrList  = result;
            [self hideMBProcess];
            [self.tableView reloadData];

            return ;
        }
        [self hideMBProcess];
        [self showAlertBox:Mesage_Titile message:@"Has not data"];
        //code
    } errorHandler:^(NSError *error) {
        [self hideMBProcess];
        [self showAlertBox:Mesage_Titile message:[NSString stringWithFormat:@"%@",error]];
    }];
    check =false;
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.arrList.count > 0){
        return self.arrList.count;
    }
    
    return 0;
}
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     ListUserViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
     ItemRecord *rc = [self.arrList objectAtIndex:indexPath.row];

     cell.lb_userName.text =rc.name;
     [cell loadImageFromURL:rc.avatar];
     return cell;
 }

@end
