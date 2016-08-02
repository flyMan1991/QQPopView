//
//  ViewController.m
//  CustomPopView
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 CES. All rights reserved.
//

#import "ViewController.h"
#import "PellTableViewSelect.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)click:(id)sender {
    [PellTableViewSelect addTableViewWithWindowFrame:CGRectMake(self.view.bounds.size.width - 160, 80, 150, 200) direction:PopDirectionLeft selectData:@[@"扫一扫",@"加好友",@"创建讨论组",@"发送到电脑",@"面对面快传",@"收钱"] images:@[@"saoyisao.png",@"jiahaoyou.png",@"taolun.png",@"diannao.png",@"diannao.png",@"shouqian.png"] action:^(NSInteger index) {
        
    } animated:YES];
}

- (IBAction)popCustomView:(id)sender {
    // 弹出QQ的自定义视图
//    [PellTableViewSelect addPellTableViewSelectWithWindowFrame:CGRectMake(self.view.bounds.size.width-100, 64, 150, 200) selectData:@[@"扫一扫",@"加好友",@"创建讨论组",@"发送到电脑",@"面对面快传",@"收钱"] images:@[@"saoyisao.png",@"jiahaoyou.png",@"taolun.png",@"diannao.png",@"diannao.png",@"shouqian.png"] action:^(NSInteger index) {
//        NSLog(@"选择%ld",index);
//    } animated:YES];
//   [PellTableViewSelect addTableViewWithWindowBounds:CGSizeMake(150, 200) position:CGPointMake(self.view.bounds.size.width-10, 64) selectData:@[@"扫一扫",@"加好友",@"创建讨论组",@"发送到电脑",@"面对面快传",@"收钱"]  images:@[@"saoyisao.png",@"jiahaoyou.png",@"taolun.png",@"diannao.png",@"diannao.png",@"shouqian.png"] action:^(NSInteger index) {
//       
//   } animated:YES];

}

@end
