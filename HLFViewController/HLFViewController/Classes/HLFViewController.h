//
//  HLFViewController.h
//  Easy-All 2.0
//
//  Created by 陈舒澳 on 2018/8/15.
//  Copyright © 2018年 陈舒澳. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HLFViewControllerDelegate <NSObject>

@optional
- (void)viewAppearAgain;

@end

@interface HLFViewController : UIViewController
@property (nonatomic, weak) id<HLFViewControllerDelegate> delegate;

#pragma mark - LifeCycle
/**
 视图完成再次出现时调用
 */
- (void)viewDidAppearAgain;

/**
 视图将要再次出现时调用
 */
- (void)viewWillAppearAgain;

#pragma mark - push
- (void)pushToViewControllerWithClass:(Class)vcClass animated:(BOOL)animated;

#pragma mark - Back/Pop
/**
 返回上一页

 @param animated 是否有动画效果
 @param completion 完成回调，仅modal页面dismiss时调用
 */
- (void)backViewControllerAnimated:(BOOL)animated completion:(void(^)(void))completion;

/**
 回到指定类的视图控制器

 @param vcClass 指定的类
 @param animated 是否有动画效果
 */
- (void)popToViewControllerWithClass:(Class)vcClass animated:(BOOL)animated;

/**
 回到指定类名的视图控制器

 @param vcString 指定的类名
 @param animated 是否有动画效果
 */
- (void)popToViewControllerWithString:(NSString *)vcString animated:(BOOL)animated;

/**
 回到指定位置的视图控制器

 @param index 指定的位置
 @param animated 是否有动画效果
 */
- (void)popToViewControllerWithIndex:(NSUInteger)index animated:(BOOL)animated;

/**
 回退指定数量的视图控制器

 @param count 指定数量
 @param animated 是否有动画效果
 */
- (void)popToViewControllerWithCount:(NSUInteger)count animated:(BOOL)animated;


@end
