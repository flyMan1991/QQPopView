/**
 !! 随便弄了一下，只是为了 目前项目的使用.过几天会 完善
 !! 加入单例等
 
 有问题可以联系 邮箱 906037367@qq.com
 QQ               906037367
 
 */



#import <UIKit/UIKit.h>


@interface PellTableViewSelect : UIView
/**
 *  创建一个弹出下拉控件
 *
 *  @param selectData 选择控件的数据源
 *  @param action     点击回调方法
 *  @param animate    是否动画弹出
 *  @param width      宽度
 *  @param offsetY    距离上边界距离
 *   高度根据selece
 */
+ (void)addTableViewWithWindowBounds:(CGSize)bounds
                             position:(CGPoint)position
                          selectData:(NSArray *)selectData
                              images:(NSArray *)images
                              action:(void(^)(NSInteger index))action
                            animated:(BOOL)animate;
/**
 *  手动隐藏
 */
+ (void)hiden;
@end
