import 'package:get/get.dart';

import '../../constants/release_way.dart';
import '../../routes/app_routes.dart';

class DiscoverController extends GetxController {
  List postList = [
    {
      "avatar": 'http://qlogo3.store.qq.com/qzone/577749710/577749710/50',
      "userName": '氤氲*',
      "fansNum": '234', // double
      "title": '蹲个口语听力学习搭子 ',
      "textPart": '''打扰各位友友了人 人
本人很喜欢英语，无奈自己口语听力一直比
较弱，我也在尝试各种方法提升，但没有专
业老师纠正走了很多弯路。最近发现了个不
错的线上直播课，是英专朋友寒假1月学过
推荐的，她说老师助教都蛮专业负责，学习
氛围比较活跃，所以打算这学期学习备考六
级，顺便为考研做准备。
都跟朋友问清楚了，直播课是在腾讯会议
上完一次课可以约一对一，有英文free talk
的机会。单独报的话不太划算，这几天有拼
团活动，2个人一起就减半，两杯奶茶钱左
右，还赠送3套听口基础课和加入365天英语
打卡圈子的机会，想来问问有没有志同道合
的伙伴一起努力，互相监督!"
不咋看qq，加微信聊(wzm136697258)''',
      "images": [
        'http://a1.qpic.cn/psc?/V52vgtw31inIzg0jfGeu23wJ1b0SopQz/bqQfVz5yrrGYSXMvKr.cqewd7LLYQx7xzlT3JhnioZ4vP..o9M2Yj9AtTBydORXt7YQque1Lg*x5ijOnK5JM9X3*IjzuZTt2HBkvkUkPrIg!/m&ek=1&kp=1&pt=0&bo=NgSwBQAAAAAWEKc!&tl=3&vuin=2942262775&tm=1713877200&dis_t=1713879088&dis_k=683fc15b0795a9ca83ce9b25f1852cf5&sce=60-4-3&rf=0-0'
      ],
    },
    {
      "avatar":
          'http://qlogo4.store.qq.com/qzone/2471314479/2471314479/30?1653747715',
      "userName": 'Vis',
      "fansNum": '0',
      "title": '弹唱',
      "textPart": '''有没有喜欢弹唱的盆友心
没事一起唱歌呀!有表演一起去玩儿!!!
自我觉得弹唱不错的宝子，加我一下
+V:GONGQUE55555-''',
      "images": [
        'http://a1.qpic.cn/psc?/V54Km1GC2ip4uh3D3ViH2zYLOh3KlJuv/ruAMsa53pVQWN7FLK88i5p6JwkunoyJ11VKJPHijIK.xHF4e*14w5K07n5AtZGF6y6kZxyryY9dKj1zyf1KGVdn3hQ.wO39sXHEMkGsAlNQ!/c&ek=1&kp=1&pt=0&tl=3&vuin=2942262775&tm=1713877200&dis_t=1713879088&dis_k=2bcd75073ab8117020e09d3ef2665806&sce=60-2-2&rf=0-0'
      ],
    },
    {
      "avatar":
          'http://qlogo3.store.qq.com/qzone/1798310490/1798310490/30?1713866820',
      "userName": '白玫瑰',
      "fansNum": '8',
      "title": '求认识',
      "textPart":
          '''你好墙墙可以给我发一个寻人帖
吗 寻找4.22号坐三号线去跨灵山
公园的这个男同学他们三个人一
起的 拿的袋子是长城杯信息铁人
岳全比赛的帆布袋 他们也是去跨
灵山玩的 想问问能不能找到这个
同学或者认识他的人''',
      "images": ['http://a1.qpic.cn/psc?/V54Km1GC2ip4uh3D3ViH2zYLOh3KlJuv/ruAMsa53pVQWN7FLK88i5p6JwkunoyJ11VKJPHijIK*12m1hsERzzIDYI9wuSnMqUR.U5R8p6ZlQXNksnZxS0EoCTYJQeShZcB7NeXw8HKo!/c&ek=1&kp=1&pt=0&tl=3&vuin=2942262775&tm=1713877200&dis_t=1713879088&dis_k=486376648ea8a2074c5fe803dd123abe&sce=60-2-2&rf=0-0'],
    },
    {
      "avatar":
          'http://qlogo2.store.qq.com/qzone/3377485857/3377485857/30?1662213461',
      "userName": 'milk',
      "fansNum": '1',
      "title": '寻猫',
      "textPart":
          '''小猫JJ于今日12点左右在8栋
宿舍附近走丢了，想问下广大的小
伙伴有没有看到的 联系vx
17608511549 麻烦你章''',
      "images": ['http://a1.qpic.cn/psc?/V54Km1GC2ip4uh3D3ViH2zYLOh3KlJuv/ruAMsa53pVQWN7FLK88i5ocBEdFZJMVtXAk9RwE3qEHshHs2y.jP*8ruVjHIOMXIG.9Mt*gyY*liilHpbmP4rBwJ9RuFYK3FDN3rP0L7TIw!/c&ek=1&kp=1&pt=0&tl=3&vuin=2942262775&tm=1713877200&dis_t=1713879088&dis_k=8f93bb1fd9630044bf17ba3314cdf8bb&sce=60-2-2&rf=0-0'],
    },
    {
      "avatar":
      'http://qlogo3.store.qq.com/qzone/2010197122/2010197122/30?1662302482',
      "userName": '傅里叶不想变换',
      "fansNum": '1',
      "title": '求推荐牙医',
      "textPart":
      '''想问问师大附近比较好的牙科医
院的具体位置 麻烦啦·''',
      "images": [],
    },
  ];

  void toRelease() {
    Get.toNamed(Routes.RELEASE, arguments: {'way': ReleaseWay.post});
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
