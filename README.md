# RogueKit2
  该库是自己在空闲时间把MBProgressHUD封装的更简单，让自己用起来更方便，但是发现越来越喜欢一些简单的封装，然后，，，有空就无聊写一点简单的东西，也希望自己的 pod 能够被大家使用，好吧，这类库中，有三个比较完整点的功能。

## 导入 pod 方法
  暂时只支持 pod,    pod 'RogueKit2'

## RgLoginViewController
  这是一个静态类方法，可以选择在加载的时候，有默认的菊花类型和 gif 动态图类型，
  如果是想在加载时候显示 gif 图片，[RgLoadingController showLoadingActivityViewOn:self hudType:RgLoadingGIF titleOrGif:@"RgRefresh"]，其中 @"RgRefresh" 这个代表了 gif 的项目中的名称，
  当然，你也可以使用 MBProgressHUD 一些默认的效果，只不过在线程上，我修改了，做了一些同步，就是在显示加载的时候，只能同时存在最多一个 菊花的效果，而且也只需要一行代码就能搞定。
  [RgLoadingController showLoadingSoonDisplayActivityViewOn:self hudType:RgLoadingDefault titleOrGif:@"哈哈哈" withAfter:2 withComplete:^{
        NSLog(@"执行完之后打印出回调函数 block");
    }]
    
## RogueCache
  一个简单的缓存类，利用 NSUserDefaults 来设置缓存，他和另一个类型 RogueViewControllerTranstion(这是下一个会讲述的内容)结合着使用，他是全局单例变量，比如下列的方法
  + (void)setSessionValues:(nullable RogueUserObject *)user;这是存储缓存的方法，这里要申明一下，如果要在项目中使用，那么缓存的类型，必须继承于RogueUserObject，才能设置缓存，否则，执行该方法时，程序会 Crash，
  当然，比如用户状态改变，例如登陆退出之类，想用通知来改变程序的一些权限，可以使用这个方法，+ (void)refreshUserSession:(nullable RogueUserObject *)user;该方法是用来刷新用户信息，可以传空值，这个方法必须最好是结合+ (void)notificationResponseWithBlock:(nonnull void (^)(NSString * _Nonnull key))response方法来使用，举个例子，在 ViewController 控制器中，先写入如下方法：__weak RgMBViewController    *weakSelf = self;
    [RogueCache notificationResponseWithBlock:^(NSString * _Nonnull key) {
        [[NSNotificationCenter defaultCenter] addObserver:weakSelf selector:@selector(changeOther:) name:key object:nil];
    }];
    
当我点击某个按钮之后，按钮响应的时间效果，就会开始调用[RogueCache refreshUserSession:rogueUserObject]这个方法来刷新用户的状态，然后，他会自动调用前者的 block里的方法以此来响应通知。你可以看看我在程序里的changeOther方法:- (void)changeOther:(NSNotification *)notification {

    RgUserObject *rg = (RgUserObject *)notification.userInfo[@"RogueCacheUserSessionKey"];
    NSLog(@"%@", rg.cards);
    
}

## RogueViewControllerTranstion
  该类是转场动画的一个类，这个类暂时没有测出什么bug，希望大家能够指出。
  关于它的使用，因为是结合到 RogueCache，所以在响应事件的时候，比如我点击某个按钮，需要 push 到一个新的界面，那么在这个按钮对应的方法里，需要加入如下的代码:
  [RogueCache shareInstance].transtionType = RoguePushTopToBottomPresentTranstion;
            [RogueCache shareInstance].transtionDuration = 0.4;
            前者是转场效果，后者是转场时间。
            
暂时就这些简单的东西，本来还有一些结构上的封装，但是想到有待测试，所以就以后再放出来，所以，如果这里的程序有bug，希望大家能够指出，本人一定好好的修改，谢谢。
