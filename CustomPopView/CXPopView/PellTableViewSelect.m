/**
 !! 随便弄了一下，只是为了 目前项目的使用.过几天会 完善
 !! 加入单例等
 
 有问题可以联系 邮箱 906037367@qq.com
 QQ               906037367
 

 */

#import "PellTableViewSelect.h"
#import "CustomPopCell.h"
#define  LeftView 10.0f
#define  TopToView 10.0f

@interface  PellTableViewSelect()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,copy) NSArray *selectData;
@property (nonatomic,copy) void(^action)(NSInteger index);
@property (nonatomic,copy) NSArray * imagesData;
@end



PellTableViewSelect * backgroundView;
UITableView * tableView;

@implementation PellTableViewSelect



+ (void)addTableViewWithWindowBounds:(CGSize)bounds
                            position:(CGPoint)position
                          selectData:(NSArray *)selectData
                              images:(NSArray *)images
                              action:(void(^)(NSInteger index))action
                            animated:(BOOL)animate
{
    if (backgroundView != nil) {
        [PellTableViewSelect hiden];
    }
    UIWindow * win = [[[UIApplication sharedApplication] windows] firstObject];
    
    backgroundView = [[PellTableViewSelect alloc] initWithFrame:win.bounds];
    backgroundView.action = action;
    backgroundView.imagesData = images ;
    backgroundView.selectData = selectData;
    backgroundView.backgroundColor = [UIColor colorWithHue:0
                                                saturation:0
                                                brightness:0 alpha:0.1];
    [win addSubview:backgroundView];
    
    tableView = [[UITableView alloc] init];
    if (selectData.count <= 4) {
        tableView.bounds = CGRectMake(0, 0, bounds.width,40 * selectData.count );
    }else{
         tableView.bounds = CGRectMake(0, 0, bounds.width, 150 );
    }
       // 确定position位置
    tableView.layer.position = position;
    // 确定定点位置
     tableView.layer.anchorPoint = CGPointMake(1.0, 0);
    // 可以得到frmae的大小了
    /*
      附上position 与 定点位置的理解公式
      http://www.tuicool.com/articles/MvI7fu3
     frame.origin.x = position.x - anchorPoint.x * bounds.size.width；
     frame.origin.y = position.y - anchorPoint.y * bounds.size.height；
     */
    tableView.dataSource = backgroundView;
    tableView.delegate = backgroundView;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.layer.cornerRadius = 10.0f;
    tableView.rowHeight = 40;
    [win addSubview:tableView];
    tableView.transform =CGAffineTransformMakeScale(0.0001, 0.0001);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackgroundClick)];
    [backgroundView addGestureRecognizer:tap];
    if (animate == YES) {
//        backgroundView.alpha = 0;
        [UIView animateWithDuration:0.3 animations:^{
//            backgroundView.alpha = 0.5;
           tableView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    }
}
+ (void)tapBackgroundClick
{
    [PellTableViewSelect hiden];
}
+ (void)hiden
{
    if (backgroundView != nil) {
        
        [UIView animateWithDuration:0.3 animations:^{
            tableView.transform = CGAffineTransformMakeScale(0.000001, 0.0001);
        } completion:^(BOOL finished) {
            [backgroundView removeFromSuperview];
            [tableView removeFromSuperview];
            tableView = nil;
            backgroundView = nil;
        }];
    }
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _selectData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"PellTableViewSelectIdentifier";
    CustomPopCell *cell =  [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[CustomPopCell alloc] initWithStyle:0 reuseIdentifier:Identifier];
        
    }
//    cell.backgroundColor = [UIColor grayColor];
//    cell.alpha = 0.01;
    cell.iconView.image = [UIImage imageNamed:self.imagesData[indexPath.row]];
    cell.titleLabel.textColor = [UIColor blackColor];
    cell.titleLabel.text = _selectData[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.action) {
        self.action(indexPath.row);
    }
    [PellTableViewSelect hiden];
}

#pragma mark 绘制三角形
- (void)drawRect:(CGRect)rect

{
    
    
    //    [colors[serie] setFill];
    // 设置背景色
    [[UIColor whiteColor] set];
    //拿到当前视图准备好的画板
    
    CGContextRef  context = UIGraphicsGetCurrentContext();
    
    //利用path进行绘制三角形
    
    CGContextBeginPath(context);//标记
    CGPoint location = tableView.layer.position;
    CGContextMoveToPoint(context,
                         location.x -  LeftView - 10, location.y);//设置起点
    
    CGContextAddLineToPoint(context,
                            location.x - 2*LeftView - 10 ,  location.y - TopToView);
    
    CGContextAddLineToPoint(context,
                            location.x - TopToView * 3 - 10, location.y);
    
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    
    [[UIColor whiteColor] setFill];  //设置填充色
    
    [[UIColor whiteColor] setStroke]; //设置边框颜色
    
    CGContextDrawPath(context,
                      kCGPathFillStroke);//绘制路径path
    
    [self setNeedsDisplay];
}

@end
