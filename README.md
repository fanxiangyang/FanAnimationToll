# FanAnimationToll
Animation class method


![动画](https://github.com/fanxiangyang/FanAnimationToll/blob/master/animation.gif?raw=true)


###  功能介绍
##### 功能介绍：封装各种动画的类方法，使用方便，具体使用如下

```
#pragma mark - CATransition基本动画
/**动画切换页面的效果(CATransition)
 
 *此方法用于任意View的layer层上面
 *subType 方向 kCATransitionFromBottom ....
 *subtypes: kCAAnimationCubic迅速透明移动,cube 3D立方体翻页 pageCurl从一个角翻页，
 *          pageUnCurl反翻页，rippleEffect水波效果，suckEffect缩放到一个角,oglFlip中心立体翻转
 *          (kCATransitionFade淡出，kCATransitionMoveIn覆盖原图，kCATransitionPush推出，kCATransitionReveal卷轴效果)
 */
+(CATransition *)fan_transitionAnimationWithSubType:(NSString *)subType withType:(NSString *)xiaoguo duration:(CGFloat)duration;


#pragma mark - CABasicAnimation动画
/**永久闪烁的动画：动画时间（秒）*/
+(CABasicAnimation *)fan_opacityForever_Animation:(float)time;
/**有闪烁次数的动画:次数+动画时间（秒）*/
+(CABasicAnimation *)fan_opacityTimes_Animation:(float)repeatTimes durTimes:(float)time;
/**横向移动:移动距离(fromX--toX)+动画时间（秒）*/
+(CABasicAnimation *)fan_moveXWithTime:(float)time fromX:(float)fromX toX:(float)toX;
/**纵向移动:移动距离(fromY--toY)+动画时间（秒）*/
+(CABasicAnimation *)fan_moveYWithTime:(float)time fromY:(float)fromY toY:(float)toY;
/**点移动:移动的是偏移量*/
+(CABasicAnimation *)fan_movepoint:(CGPoint )point;
/**动画放大和缩小:放大倍数+动画次数 */
+(CABasicAnimation *)fan_scaleMax:(float)multiple orginMin:(float)orginMultiple durTimes:(float)time Rep:(float)repeatTimes;
/**组合动画:动画时间+动画次数 */
+(CAAnimationGroup *)fan_groupAnimation:(NSArray *)animationAry durTimes:(float)time Rep:(float)repeatTimes; //组合动画

/** 旋转绕Z轴
 
 * dur 时间
 * degree旋转角度
 * direction方向(0-1)
 * repeatCount次数
 */
+(CABasicAnimation *)fan_rotationTime:(float)dur degree:(float)degree directionZ:(float)directionZ repeatCount:(int)repeatCount;
/** 围绕三维坐标轴旋转（单个动画时间+3D)
 
 *第一个参数是旋转角度(pi/2正向，1.5pi逆向），后面三个参数形成一个围绕其旋转的向量(x,y,z)，起点位置由UIView的center属性标识。
 *CATransform3D t = CATransform3DMakeRotation(CGFloat angle, CGFloat x, CGFloat y, CGFloat z);
 */
+(CABasicAnimation *)fan_rotationTime:(float)dur transform3D:(CATransform3D)transform3D;

/**左右晃动:是偏移量移动*/
+(CABasicAnimation *)fan_rockWithTime:(float)time fromX:(float)fromX toX:(float)toX repeatCount:(int)repeatCount;
/**上下晃动:是偏移量移动*/
+(CABasicAnimation *)fan_rockWithTime:(float)time fromY:(float)fromY toY:(float)toY repeatCount:(int)repeatCount;

#pragma mark - CAKeyframeAnimation动画
/**路径动画（点的移动，圆，曲线）
 
 *path 路径
 *time 持续的时间
 *repeatTimes 重复的次数
 */
+(CAKeyframeAnimation *)fan_keyframeAniamtion:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes; //路径动画
/**左右摇晃,图标的抖动:抖动宽度+强度*/
+(CAKeyframeAnimation * )fan_shakeAnimationWidth:(float)shakeWidth sigleDuration:(float)sigleDuration;
```

*   各种动画使用方便，你会喜欢的！
###开发环境

* OS X 10.11beat
* Xcode Version 6.3.2 

####有问题请直接在文章下面留言。
####喜欢此系列文章可以点击上面右侧的 Star 哦，变成 Unstar 就可以了！ 


###开发人：凡向阳
####Email:fanxiangyang_heda@163.com


