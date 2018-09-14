 //
//  HLFViewController.m
//  Easy-All 2.0
//
//  Created by 陈舒澳 on 2018/8/15.
//  Copyright © 2018年 陈舒澳. All rights reserved.
//

#import "HLFViewController.h"

@interface HLFViewController ()
@property (nonatomic, strong) UIViewController *vc;
@property (nonatomic, assign) BOOL isDidAppear; //是否已出现过一次

@end

@implementation HLFViewController
#pragma mark - LifeCycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass([self class]);
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
#ifdef DDLogVerbose//(frmt, ...)
     DDLogVerbose(@"%@ willDisappear",[self class]);
#endif
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
#ifdef DDLogVerbose//(frmt, ...)
    DDLogVerbose(@"%@ didDisappear",[self class]);
#endif
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.isDidAppear)
    {
        [self viewDidAppearAgain];
    }
    else
    {
        self.isDidAppear = YES;
#ifdef DDLogVerbose//(frmt, ...)
        DDLogVerbose(@"%@ didAppear",[self class]);
#endif
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.isDidAppear)
    {
        [self viewWillAppearAgain];
    }
    else
    {
#ifdef DDLogVerbose//(frmt, ...)
         DDLogVerbose(@"%@ willAppear",[self class]);
#endif
    }
}

//页面再次出现
- (void)viewDidAppearAgain
{
#ifdef DDLogVerbose//(frmt, ...)
    DDLogVerbose(@"%@ didAppearAgain",[self class]);
#endif
}

//页面将再次出现
- (void)viewWillAppearAgain
{
#ifdef DDLogVerbose//(frmt, ...)
    DDLogVerbose(@"%@ WillAppearAgain",[self class]);
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
#ifdef DDLogVerbose//(frmt, ...)
    DDLogVerbose(@"%@ dealloc",[self class]);
#endif
}

#pragma mark - Delegate Methods

#pragma mark - Public Methods

#pragma mark - push
- (void)pushToViewControllerWithClass:(Class)vcClass animated:(BOOL)animated
{
    UIViewController *vc = nil;
    vc = [[[vcClass class] alloc]init];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Back/Pop
//返回
- (void)backViewControllerAnimated:(BOOL)animated completion:(void(^)(void))completion
{
    if (self.presentingViewController&&self.navigationController.viewControllers.count == 1) //modal的页面，且没有push到下一个界面
    {
        [self dismissViewControllerAnimated:animated completion:completion];
    }
    else if (self.navigationController.viewControllers.count > 1)
    {
        [self.navigationController popViewControllerAnimated:animated];
    }
    
#ifdef DDLogWarn//(frmt, ...)
    DDLogWarn(@"无路可退");
#endif
}

//回到指定类的视图控制器
- (void)popToViewControllerWithClass:(Class)vcClass animated:(BOOL)animated
{
    NSArray *arrViewControllers = self.navigationController.viewControllers;
    
    [arrViewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:vcClass])
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.navigationController popToViewController:(UIViewController *)obj animated:animated];
                *stop = YES;
            });
        }
    }];
#ifdef DDLogWarn//(frmt, ...)
    DDLogWarn(@"此路不通");
#endif
}

//回到指定类名的视图控制器
- (void)popToViewControllerWithString:(NSString *)vcString animated:(BOOL)animated
{
    NSArray *arrViewControllers = self.navigationController.viewControllers;
    
    [arrViewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:NSClassFromString(vcString)])
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.navigationController popToViewController:(UIViewController *)obj animated:animated];
                *stop = YES;
            });
        }
    }];
#ifdef DDLogWarn//(frmt, ...)
    DDLogWarn(@"此路不通");
#endif
}

//回到指定位置的视图控制器
- (void)popToViewControllerWithIndex:(NSUInteger)index animated:(BOOL)animated
{
    NSArray *arrViewControllers = self.navigationController.viewControllers;
    
    if (arrViewControllers.count > index)
    {
        [self.navigationController popToViewController:arrViewControllers[index] animated:animated];
    }
#ifdef DDLogWarn//(frmt, ...)
    DDLogWarn(@"以退为进？");
#endif
}

//回退指定数量的视图控制器
- (void)popToViewControllerWithCount:(NSUInteger)count animated:(BOOL)animated
{
    NSArray *arrViewControllers = self.navigationController.viewControllers;
    
    if (arrViewControllers.count > count)
    {
        [self.navigationController popToViewController:arrViewControllers[arrViewControllers.count - count - 1] animated:animated];
    }
#ifdef DDLogWarn//(frmt, ...)
    DDLogWarn(@"再退是悬崖");
#endif
}

#pragma mark - Private Methods


#pragma mark - Layout Methods

#pragma mark - Get/Set Methods


@end
