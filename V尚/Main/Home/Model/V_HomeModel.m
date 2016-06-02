//
//  V_HomeModel.m
//  V尚
//
//  Created by oujinlong on 16/5/18.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "V_HomeModel.h"

@implementation V_HomeModel
+(NSArray *)models{
    //模拟 6个随机头像
    NSArray* avatarList = @[@"http://img.woyaogexing.com/2016/05/18/0a86ffd5dbf65954!200x200.jpg",
                         @"http://img.woyaogexing.com/2016/05/17/79668469070d4418!200x200.jpg",
                         @"http://img.woyaogexing.com/2016/05/13/dd8edab1e0d0753a!200x200.jpg",
                         @"http://ww1.sinaimg.cn/crop.0.0.960.960.1024/e934c00ajw8ejvzetjo8cj20qo0qo0uc.jpg",
                         @"http://cdn.duitang.com/uploads/item/201406/05/20140605151902_dUEE3.jpeg",
                         @"http://image.suning.cn/content/catentries/00000000012406/000000000124060152/fullimage/000000000124060152_1f.jpg",
                            @"http://img.woyaogexing.com/2016/03/24/690e3f404d961561!200x200.jpg",
                            @"http://img.woyaogexing.com/2016/01/04/a4c2b01e69c85dad!200x200.jpg",
                            @"http://img.woyaogexing.com/2015/05/07/a485d351b218f1ee!200x200.jpg",
                            @"http://img.woyaogexing.com/2015/05/07/df79c70d4cb8bb5c!200x200.jpg",
                            @"http://img.woyaogexing.com/2015/02/22/da95104349a7fa4e!200x200.jpg",
                            @"http://img.woyaogexing.com/2015/01/12/2bcf5ed7870fc409!200x200.jpg"];
    //模拟昵称 7 个
    NSArray* nickNameList = @[@"Alex Qian",@"Demon",@"Papi JIang",@"Guardian",@"iOS Master",@"Asia",@"yoyo",@"Nothing",@"Oujinlong",@"Star",@"MayDay"];
    
    //模拟内容图片 10 个
    NSArray* imageList = @[@"https://img.alicdn.com/bao/uploaded/i1/TB1nCBFMXXXXXc0XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg",
                           @"https://img.alicdn.com/bao/uploaded/i2/TB13VxqMpXXXXa_XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg",
                           @"https://img.alicdn.com/bao/uploaded/i1/TB12I2qMXXXXXctXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg",
                           @"http://s11.sinaimg.cn/middle/6cfd5754g95c7b50aed0a&690",
                           @"http://d6.yihaodianimg.com/N05/M0B/89/3B/CgQI01VkIC6AUo7_AAU647I0smo60000.jpg",
                           @"http://p1.55tuanimg.com/static/goods/richText/2013/11/04/13/9abce12337a8f5a7067cc2d501f88713_690_470.jpg",
                           @"http://s8.sinaimg.cn/mw690/0039hRZZgy6DSee3epV87&690",
                           @"http://img3.makepolo.net/img3/000/000/_13747159623066.png",
                           @"http://img003.hc360.cn/g2/M07/0F/C4/wKhQuFMWzVaEE60wAAAAAB4SNSo982.jpg"
                           ,@"http://qnm.hunliji.com/o_1a9l034h2ii8f9q1a181mggc2v17.jpg?imageView/2/w/680%7Cwatermark/1/image/aHR0cDovL3FucGljLmh1bmxpamkuY29tL3dhdGVybWFyay5wbmc=/dx/20/dy/20/dissolve/80",
                           @"http://s21.mogucdn.com/b7/pic/150517/16hfj3_ie2wkyrzgfrtgojtgezdambqhayde_680x460.jpg_880x999.jpg",
                           @"http://s6.mogujie.cn/b7/pic/131231/11x30k_kqzgkucfkrbhss3wgfjeg5sckzsew_680x460.jpg"
                           ,@"http://image.rakuten.co.jp/gold-japan/cabinet/tops/img56629932.jpg",
                           @"http://image.rakuten.co.jp/gold-japan/cabinet/tunic2/img57162083.jpg",
                           @"http://image.rakuten.co.jp/gold-japan/cabinet/tunic/img56726177.jpg",
                           @"http://image.rakuten.co.jp/gold-japan/cabinet/tunic/img56790841.jpg",
                           @"http://image.rakuten.co.jp/gold-japan/cabinet/tunic2/img57704033.jpg",
                           @"http://image.rakuten.co.jp/gold-japan/cabinet/tunic/img56618558.jpg",
                           @"https://img.alicdn.com/bao/uploaded/i3/1650710943/TB2O7qhlFXXXXcJXXXXXXXXXXXX_!!1650710943.jpg_430x430q90.jpg",
                           @"http://d01.res.meilishuo.net/pic/_o/cd/a3/ef96a254669af6707ffb54f21663_2989_3325.c1.jpg"];
    
    //模拟标题 8个
    NSArray* titleList = @[@"夏日必不可少的搭配",@"夏日搭配日常",@"潮流新风尚",@"2016新潮流",@"春日的午后不可辜负",@"春风十里，不如你",@"经不住似水流年，逃不过此间少年",@"夏日显瘦，最新搭配"];
    //模拟内容 6 个
    NSArray* contentList = @[@"范冰冰是公认的微胖界女神，人无完人，虽然有着完美的容貌，但是身材并没有太完美，修饰自己的身材。下面我们就来看看微胖女神范冰冰穿衣搭配示范告诉你胖人穿衣搭配技巧是什么。",
                             @"小碎花元素是春夏季的常见主打，碎花裙也是是很多女孩衣橱里的必备单品，那么碎花裙配什么鞋子最合好看呢?下面就为大家介绍一下2016碎花裙搭配方法，让你时尚度过春夏季。",
                             @"夏季马上就要到了，怎么能少了一件防晒衣呢?很多人都觉得防晒衣太难看，下面就一起来看看看潮人们的防晒衣搭配法吧。",
                             @"阔腿裤作为时下最流行的时尚单品之一，已经遍布大街小巷，你还在犹豫要不要穿阔腿裤、阔腿裤怎么搭配的问题吗？下面跟爱美女性网小编一起来看看明星们如何搭配阔腿裤，教你秒变时尚达人。",
                             @"很多人都会说，春夏这么浪漫的季节，不就应该穿着裙子到处溜达吗？你看时装秀都是以裙装为主打的。但是裤装的舒服休闲感也是我们一直以来无法抛弃的，不然这些达人明星们怎么都爱穿裤装呢，看完你就知道不是没有道理的！",
                             @"一到秋冬季，除了衣服难搭，鞋子的选择也让人十分困恼，百搭款太普通，看上去又没啥质感。个性点的又不好搭配。那到底该怎么办呢？别担心，小编来帮你，今天，小编就就给大家带来一款百搭好鞋，那就是，漆皮鞋。百搭的款式，充满质感的外表绝对能满足你对鞋子的所有幻想。"];
    
    NSMutableArray* modelList = [NSMutableArray array];
    
    for (NSInteger i = 0 ; i < 10; i ++) {
        V_HomeModel* model = [[V_HomeModel alloc] init];
        model.senderAvatar = avatarList[arc4random_uniform(12)];
        model.senderNickName = nickNameList[arc4random_uniform(11)];
        model.imageUrl = imageList[arc4random_uniform(20)];
        model.titie = titleList[arc4random_uniform(7)];
        model.content = contentList[arc4random_uniform(5)];
        model.zan = arc4random_uniform(2000);
        model.views = arc4random_uniform(3000);
        
        [modelList addObject:model];
    }
    
    return modelList;
    
}
@end
