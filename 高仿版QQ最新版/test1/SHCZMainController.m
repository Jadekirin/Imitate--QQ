//
//  SHCZMainController.m
//  test1
//
//  Created by Devil on 16/1/4.
//  Copyright © 2016年 Devil. All rights reserved.
//

#import "SHCZMainController.h"
#import "SHCZContacter.h"
#import "SHCZNews.h"
#import "SHCZDynamicController.h"
#import "UIView+SHCZExt.h"





@interface SHCZMainController ()

@property(nonatomic,strong)UIViewController *nav;



@end

@implementation SHCZMainController
-(NSString *)name{
    if (!_name) {
        _name=@"消息";
    }
    return _name;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    添加拖拽
  UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(didPanEvent:)];


       [self.view addGestureRecognizer:pan];

    //   加载子控制器
    [self loadSubController];


}



//实现拖拽
-(void)didPanEvent:(UIPanGestureRecognizer *)recognizer{
    
// 1. 获取手指拖拽的时候, 平移的值
CGPoint translation = [recognizer translationInView:recognizer.view];

// 2. 让当前控件做响应的平移
recognizer.view.transform = CGAffineTransformTranslate(recognizer.view.transform, translation.x, 0);
// ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

[[[UIApplication sharedApplication].delegate window].subviews objectAtIndex:1].ttx=recognizer.view.ttx/3;
//    NSLog(@"%f",translation.x/5);
 // ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
   // 3. 每次平移手势识别完毕后, 让平移的值不要累加
[recognizer setTranslation:CGPointZero inView:recognizer.view];

//    NSLog(@"%f",recognizer.view.transform.tx);
//    NSLog(@"%f",translation.x);
//    NSLog(@"====================");
//

//获取最右边范围
CGAffineTransform  rightScopeTransform=CGAffineTransformTranslate([[UIApplication sharedApplication].delegate window].transform,[UIScreen mainScreen].bounds.size.width*0.75, 0);

//    当移动到右边极限时
if (recognizer.view.transform.tx>rightScopeTransform.tx) {
    
//        限制最右边的范围
    recognizer.view.transform=rightScopeTransform;
//        限制透明view最右边的范围
    [[[UIApplication sharedApplication].delegate window].subviews objectAtIndex:1].ttx=recognizer.view.ttx/3;
    
//        当移动到左边极限时
}else if (recognizer.view.transform.tx<0.0){
    
//        限制最左边的范围
recognizer.view.transform=CGAffineTransformTranslate([[UIApplication sharedApplication].delegate window].transform,0, 0);
//    限制透明view最左边的范围
    [[[UIApplication sharedApplication].delegate window].subviews objectAtIndex:1].ttx=recognizer.view.ttx/3;
    
}
    //    当托拽手势结束时执行
if (recognizer.state == UIGestureRecognizerStateEnded)
{
    [UIView animateWithDuration:0.2 animations:^{
        
        if (recognizer.view.x >[UIScreen mainScreen].bounds.size.width*0.5) {
            
            recognizer.view.transform=rightScopeTransform;

            [[[UIApplication sharedApplication].delegate window].subviews objectAtIndex:1].ttx=recognizer.view.ttx/3;
        
        }else{
        
            recognizer.view.transform = CGAffineTransformIdentity;
                
            [[[UIApplication sharedApplication].delegate window].subviews objectAtIndex:1].ttx=recognizer.view.ttx/3;
            }
          }];
        }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


    //加载子控制器
-(void)loadSubController{

    //    消息控制器
    SHCZNews *news=[[SHCZNews alloc]init];
    UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:news];
    nav1.tabBarItem.title=@"消息";
    nav1.tabBarItem.image=[UIImage imageNamed:@"tab_recent_nor"];




    //联系人控制器
    SHCZContacter *contacter=[[SHCZContacter alloc]init];

    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:contacter];

    nav2.tabBarItem.title=@"联系人";

    nav2.tabBarItem.image=[UIImage imageNamed:@"tab_buddy_nor"];



    //    动态控制器
    SHCZDynamicController *dynamic=[[SHCZDynamicController alloc]init];

    UINavigationController *nav3=[[UINavigationController alloc]initWithRootViewController:dynamic];

    nav3.tabBarItem.title=@"动态";

    nav3.tabBarItem.image=[UIImage imageNamed:@"tab_qworld_nor"];



    self.viewControllers=@[nav1,nav2,nav3];


}


@end
