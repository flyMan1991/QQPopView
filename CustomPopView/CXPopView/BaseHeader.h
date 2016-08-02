//
//  BaseHeader.h
//  iOS-ITSM
//
//  Created by mac on 15/11/5.
//  Copyright © 2015年 CES. All rights reserved.
//

#define FONT(a)  [UIFont systemFontOfSize:a]

 // rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//带有RGBA的颜色设置
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define CellHeigh  60.0f
#define SPACE 10.0f
#define ICON_WIDTH 35.f
//定义UIImage对象
#define ImageNamed(_pointer) [UIImage imageNamed:_pointer]

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


// 折线图颜色设置
//左侧文本和文字的颜色(Y轴颜色)
#define LeftAxisLabelColor [UIColor whiteColor]
// X轴颜色
#define XAxisLabelColor    [UIColor whiteColor]
//折线的颜色
#define LineChartColor [UIColor redColor]
//折线眼圈的颜色
#define LineChartHoleAndCircleColor [UIColor redColor]
// value值得颜色
#define YAxisValueColor [UIColor redColor]

// 照片相关
typedef enum : NSUInteger {
    SelectPhotoLocal = 0, // 本地相册
    SelectPhotoTakePhoto, // 拍照
}SelectPhotoStyle;

// 试图控制器相关
#define kClassKey   @"VCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"

/**
 *  系统颜色整合
 */
#pragma mark - SystemColor
#define BlackColor [UIColor blackColor]
#define WhiteColor [UIColor whiteColor]
#define RedColor [UIColor redColor]
#define BlueColor [UIColor blueColor]
#define OrangeColor [UIColor orangeColor]
#define LightGrayColor [UIColor lightGrayColor]
#define LightTextColor [UIColor lightTextColor]


// 订阅主题相关的
static NSString * const SUBTOPIC = @"aiotm/";


// nslog 相关的
#ifdef DEBUG
#define LRLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define LRLog(...)

#endif




//弱引用/强引用
#define LRWeakSelf(type)  __weak typeof(type) weak##type = type;
#define LRStrongSelf(type)  __strong typeof(type) type = weak##type;


// 设置 view 圆角和边框
#define LRViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


/**
 * 设置加载提示框
 */
// 加载
#define kShowNetworkActivityIndicator() [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
// 收起加载
#define HideNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
// 设置加载
#define NetworkActivityIndicatorVisible(x)  [UIApplication sharedApplication].networkActivityIndicatorVisible = x

#define kWindow [UIApplication sharedApplication].keyWindow



/**
 *  沙盒目录文件
 */
//获取temp
#define kPathTemp NSTemporaryDirectory()

//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

/*
 *  动画相关
*/
#define  ANIMATEDURATION  0.25
#define  DATEPICKERHEIGH  200
#define  TOOLBARHEIGH     40
