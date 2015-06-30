//
//  ViewController.m
//  FanAnimationToll
//
//  Created by Fan on 15/4/22.
//  Copyright (c) 2015年 未名空间. All rights reserved.
//

#import "ViewController.h"
#import "FanAnimationToll.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    self.navigationController.navigationBar.translucent=NO;
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(animationTypeClick)];
    
    [self addAnimation];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)addAnimation{
    self.animationImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 200)];//(0, 0, 120, 120)
    self.animationImageView.center=self.view.center;
    self.animationImageView.image=[UIImage imageNamed:@"1.png"];
    [self.view addSubview:self.animationImageView];
}


-(void)animationTypeClick{
    UIActionSheet *acSheet=[[UIActionSheet alloc]initWithTitle:@"选择动画方式" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"永久闪烁",@"带次数闪烁",@"X移动",@"Y移动",@"大小缩放",@"组合动画",@"路径移动" ,@"点移动",@"抖动",@"左右晃动",@"旋转",@"三维旋转",nil];
    acSheet.delegate=self;
    //    [acSheet showInView:self.view];
    [acSheet showFromBarButtonItem:self.navigationItem.rightBarButtonItem animated:YES];
    //[acSheet showFromTabBar:self.tabBarController.tabBar];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"button:%ld",buttonIndex);
    switch (buttonIndex) {
        case 0:
        {
            [self.animationImageView.layer addAnimation:[FanAnimationToll fan_opacityForever_Animation:0.3] forKey:@"opacity.Forever"];
        }
            break;
        case 1:
        {
            [self.animationImageView.layer addAnimation:[FanAnimationToll fan_opacityTimes_Animation:3 durTimes:0.3] forKey:@"opacity.times"];
        }
            break;
        case 2:
        {
            [self.animationImageView.layer addAnimation:[FanAnimationToll fan_moveXWithTime:1 fromX:-100 toX:100] forKey:@"move.x"];
        }
            break;
        case 3:
        {
            [self.animationImageView.layer addAnimation:[FanAnimationToll fan_moveYWithTime:1 fromY:-100 toY:100] forKey:@"move.y"];
        }
            break;
        case 4:
        {
            [self.animationImageView.layer addAnimation:[FanAnimationToll fan_scaleMax:2 orginMin:0.1 durTimes:1 Rep:5] forKey:@"scale"];
        }
            break;
        case 5:
        {
            [self.animationImageView.layer addAnimation:[FanAnimationToll fan_groupAnimation:@[[FanAnimationToll fan_scaleMax:2 orginMin:0.1 durTimes:1 Rep:5],[FanAnimationToll fan_opacityTimes_Animation:3 durTimes:0.3]] durTimes:3 Rep:3] forKey:@"group"];
        }
            break;
        case 6:
        {
            CGMutablePathRef path=CGPathCreateMutable();
            //4周移动
            CGPathMoveToPoint(path,NULL,0, 64);
            CGPathAddLineToPoint(path,NULL, 320, 64);
            CGPathAddLineToPoint(path, NULL, 0, 480);
            CGPathAddLineToPoint(path, NULL, 320, 480);
            CGPathAddLineToPoint(path,NULL, 40, 40);
            CGPathCloseSubpath(path);
            
            //圆
            CGPathAddArc(path, NULL, 150, 200, 200, 0, 6.28, NO);
            CGPathAddRect(path, NULL, CGRectMake(0, 0, 320, 480));
            CGPathCloseSubpath(path);
            [self.animationImageView.layer addAnimation:[FanAnimationToll fan_keyframeAniamtion:path durTimes:2 Rep:5] forKey:@"position"];
        }
            break;
        case 7:
        {
            [self.animationImageView.layer addAnimation:[FanAnimationToll fan_movepoint:CGPointMake(100, 100)] forKey:@"point"];
        }
            break;
        case 8:
        {
            [self.animationImageView.layer addAnimation:[FanAnimationToll fan_shakeAnimationWidth:10 sigleDuration:0.1] forKey:@"shake"];
        }
            break;
        case 9:
        {
            [self.animationImageView.layer addAnimation:[FanAnimationToll fan_rockWithTime:0.3 fromX:0 toX:100 repeatCount:6] forKey:@"rock"];
        }
            break;
        case 10:
        {
            [self.animationImageView.layer addAnimation:[FanAnimationToll fan_rotationTime:0.2 degree:M_PI*0.5 directionZ:0.5 repeatCount:4*2] forKey:@"rotation"];
        }
            break;
        case 11:
        {
            CATransform3D transform3D=CATransform3DMakeRotation(M_PI_2, 0.2, 0.6, 0.4);
            //CATransform3D transform3D=CATransform3DMakeScale(0.51, 0.1, 1);
            [self.animationImageView.layer addAnimation:[FanAnimationToll fan_rotationTime:0.2 transform3D:transform3D] forKey:@"rotation3D"];
        }
            break;
        default:
            break;
    }
}







//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    self.navigationController.navigationBar.translucent=NO;
//    ImageViewController *imgVC=[[ImageViewController alloc]init];
//    //UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:imgVC];
//    [imgVC.view.layer addAnimation:[FanAnimationToll addAnimationWithSubType:kCATransitionFromRight withType:@"oglFlip" duration:1] forKey:nil];
//    [self.navigationController pushViewController:imgVC animated:YES];
//
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
