import 'package:get/get.dart';

import '../constants/I18n_content.dart';
class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN': {
      /// tab
      I18nContent.TAB_HOME: '首页',
      I18nContent.TAB_DISCOVER: '发现',
      I18nContent.TAB_MESSAGE: '消息',
      I18nContent.TAB_USER: '我的',

      /// 分类
      I18nContent.PHONE : '手机',
      I18nContent.COMPUTER : '电脑',
      I18nContent.CAR : '车',
      I18nContent.BED : '床上用品',
      I18nContent.BOOK : '图书',
      I18nContent.FOOD : '食品',
      I18nContent.CLOTHING : '服装',
      I18nContent.RENTING : '租房',
      I18nContent.MUSICA : '乐器',
      I18nContent.JEWELRY : '首饰',
      I18nContent.GAME : '游戏',
      I18nContent.OTHER : '其他',
      I18nContent.ALL : '全部',

      /// 提示
      I18nContent.HINT: '提示',
      I18nContent.HINT_AMAP: '检测到高德地图~',
      I18nContent.HINT_TX_MAP: '未检测到腾讯地图~',
      I18nContent.HINT_BDMAP: '未检测到百度地图~',
      I18nContent.HINT_APPLE_MAP: '未检测到苹果地图~',
      I18nContent.POSITIONLOADING : '位置加载中...',
      I18nContent.LATETRY : '过会儿在试试吧！',
      I18nContent.ALLREADHINT : '确定要全部已读吗？',
      I18nContent.AUTHLOGINHINT : '未注册的手机号将自动注册并登录',
      I18nContent.ERRORLOCATION : '定位获取失败',
      I18nContent.TELECOM : '天翼数字生活账号',
      I18nContent.PROVIDESERVICE : '为您提供号码认证服务',
      I18nContent.INPUTPHONE : '请输入手机号',
      I18nContent.INPUTPASSWORD : '请输入6~12位密码',
      I18nContent.INPUTCODE : '请输入您收到的验证码',
      I18nContent.AGREEPRO : '请您先同意协议',
      I18nContent.INPUTTITLE : '请输入宝贝名称',

      /// 按钮
      I18nContent.CONFIRM : '确定',
      I18nContent.CANCEL : '取消',
      I18nContent.SETTING : '设置',
      I18nContent.HELP : '帮助',
      I18nContent.LOCATION: '位置',
      I18nContent.SIGNUP : '登录',
      I18nContent.SIGNIN : '注册',
      I18nContent.SEARCHFAVORITES : '搜你喜欢',
      I18nContent.GUESSLIKE : '猜你喜欢',
      I18nContent.SEEALL : '查看全部',
      I18nContent.ALLREAD : '全部已读',
      I18nContent.ATTENTION : '关注',
      I18nContent.FOLLWED : '已关注',
      I18nContent.COLLECT : '收藏',
      I18nContent.HISTORY : '历史',
      I18nContent.POST : '帖子',
      I18nContent.POSTED : '发布的',
      I18nContent.SOLD : '卖出的',
      I18nContent.PURCHASED : '买到的',
      I18nContent.RELEASEIDLE : '发布闲置',
      I18nContent.RELEASE : '发布',
      I18nContent.AGREE : '同意',
      I18nContent.ONEKEYLOGIN : '一键登录',
      I18nContent.OTHERLOGIN : '其他方式登录',
      I18nContent.REMEMMBERPASSWORD : '记住密码',
      I18nContent.FORGETPASSWORD : '忘记密码',
      I18nContent.GETCODE : '获取验证码',
      I18nContent.RECENTSEARCH : '最近搜素',
      I18nContent.MESSAGE : '消息',
      I18nContent.SHARE : '分享',
      I18nContent.LIKE : '点赞',
      I18nContent.FORUM : '论坛',
      I18nContent.COWRY : '宝贝',
      I18nContent.COMMODITY : '商品',
      I18nContent.CONTACTBUY : '联系买家',
      I18nContent.CONTACTSELLER : '联系卖家',
      I18nContent.OBLIGATION : '待付款',
      I18nContent.DECOCKER : '待发货',
      I18nContent.WAITFORREC : '待收货',
      I18nContent.REMAINEVAL : '待评价',
      I18nContent.BEINGREF : '退款中',
      I18nContent.PRIVATELETTER : '私信',

      /// 文字
      I18nContent.FANS : '粉丝',
      I18nContent.SEARCHHINT : '搜素聊天记录/联系人',
      I18nContent.PERSONTAG : '吃瓜群众',
      I18nContent.ARTICLEINTRODUCTION : '介绍一下宝贝的各方面信息',
      I18nContent.PRICE : '价格',
      I18nContent.UNIT : '￥',
      I18nContent.TAGLINE : '交流的是故事，得到的是实惠。',
      I18nContent.USER_TAGLINE : '闲置转换为宝藏，交易赋予新生！',
      I18nContent.AGREEMENT : '《账号服务与隐私协议》',
      I18nContent.AUTHORIZATION : '并授权获取手机号码',
      I18nContent.PLATFORMSERVER : '平台服务政策',
      I18nContent.PRIVACYPOLICY : '隐私协议',
      I18nContent.ACCPASLOGIN : '账号密码登录',
      I18nContent.CODELOGIN : '验证码登录',
      I18nContent.AND : '和',
      I18nContent.NOINFO : '暂无消息',
      I18nContent.NOINFOHINT : '在设置中打开通知功能，信息不会错过!',
      I18nContent.NOPURCHASED : '暂无购买',
      I18nContent.NOPURCHASEDHINT : '现在还没有购买任何东西哦！快去首页进行购买吧！',
      I18nContent.NOSOLD : '你的钱包是空的',
      I18nContent.NOSOLDHINT : '看来你的钱包里没钱了，继续售卖闲置物品吧！',
      I18nContent.NORELEASED : '暂无发布',
      I18nContent.NORELEASEDHINT : '暂无发布的商品！快去发布第一个商品吧！',
      I18nContent.NOPOST : '暂无帖子',
      I18nContent.NOHISTORY : '暂无历史',
      I18nContent.NOCOLLECT : '暂无收藏',

    },
    'en_US': {

      /// tab
      I18nContent.TAB_HOME: I18nContent.TAB_HOME,
      I18nContent.TAB_DISCOVER: I18nContent.TAB_DISCOVER,
      I18nContent.TAB_MESSAGE: I18nContent.TAB_MESSAGE,
      I18nContent.TAB_USER: I18nContent.TAB_USER,

      /// 分类
      I18nContent.PHONE : I18nContent.PHONE,
      I18nContent.COMPUTER : I18nContent.COMPUTER,
      I18nContent.CAR : I18nContent.CAR,
      I18nContent.BED : I18nContent.BED,
      I18nContent.BOOK : I18nContent.BOOK,
      I18nContent.FOOD : I18nContent.FOOD,
      I18nContent.CLOTHING : I18nContent.CLOTHING,
      I18nContent.RENTING : I18nContent.RENTING,
      I18nContent.MUSICA : I18nContent.MUSICA,
      I18nContent.JEWELRY : I18nContent.JEWELRY,
      I18nContent.GAME : I18nContent.GAME,
      I18nContent.OTHER : I18nContent.OTHER,
      I18nContent.ALL : I18nContent.ALL,

      /// 按钮
      I18nContent.CONFIRM : I18nContent.CONFIRM,
      I18nContent.CANCEL : I18nContent.CANCEL,
      I18nContent.SETTING : I18nContent.SETTING,
      I18nContent.HELP : I18nContent.HELP,
      I18nContent.AGREE : I18nContent.AGREE,
      I18nContent.SIGNUP : I18nContent.SIGNUP,
      I18nContent.SIGNIN : I18nContent.SIGNIN,
      // 收藏
      I18nContent.COLLECT : I18nContent.COLLECT,
      I18nContent.HISTORY : I18nContent.HISTORY,
      I18nContent.POST : I18nContent.POST,
      // 发布的
      I18nContent.POSTED : I18nContent.POSTED,
      I18nContent.SOLD : I18nContent.SOLD,
      // 买到的
      I18nContent.PURCHASED : I18nContent.PURCHASED,
      // 关注
      I18nContent.ATTENTION : I18nContent.ATTENTION,
      // 已关注
      I18nContent.FOLLWED : I18nContent.FOLLWED,
      I18nContent.LOCATION: I18nContent.LOCATION,
      // 搜你喜欢
      I18nContent.SEARCHFAVORITES : I18nContent.SEARCHFAVORITES,
      // 猜你喜欢
      I18nContent.GUESSLIKE: I18nContent.GUESSLIKE,
      I18nContent.SEEALL : I18nContent.SEEALL,
      I18nContent.ALLREAD : I18nContent.ALLREAD,
      // 搜素聊天记录/联系人
      I18nContent.SEARCHHINT : I18nContent.SEARCHHINT,
      // 人物标签
      I18nContent.PERSONTAG : I18nContent.PERSONTAG,
      // 发布闲置
      I18nContent.RELEASEIDLE : I18nContent.RELEASEIDLE,
      // 发布
      I18nContent.RELEASE : I18nContent.RELEASE,
      I18nContent.ONEKEYLOGIN : I18nContent.ONEKEYLOGIN,
      I18nContent.OTHERLOGIN : I18nContent.OTHERLOGIN,
      I18nContent.REMEMMBERPASSWORD : I18nContent.REMEMMBERPASSWORD,
      I18nContent.FORGETPASSWORD : I18nContent.FORGETPASSWORD,
      I18nContent.GETCODE : I18nContent.GETCODE,
      I18nContent.RECENTSEARCH : I18nContent.RECENTSEARCH,
      I18nContent.MESSAGE : I18nContent.MESSAGE,
      I18nContent.SHARE : I18nContent.SHARE,
      I18nContent.LIKE : I18nContent.LIKE,
      I18nContent.FORUM : I18nContent.FORUM,
      I18nContent.COWRY : I18nContent.COWRY,
      I18nContent.COMMODITY : I18nContent.COMMODITY,
      I18nContent.CONTACTBUY : I18nContent.CONTACTBUY,
      I18nContent.CONTACTSELLER : I18nContent.CONTACTSELLER,
      I18nContent.OBLIGATION : I18nContent.OBLIGATION,
      I18nContent.DECOCKER : I18nContent.DECOCKER,
      I18nContent.WAITFORREC : I18nContent.WAITFORREC,
      I18nContent.REMAINEVAL : I18nContent.REMAINEVAL,
      I18nContent.BEINGREF : I18nContent.BEINGREF,
      I18nContent.PRIVATELETTER : I18nContent.PRIVATELETTER,

      ///  提示
      I18nContent.HINT: I18nContent.HINT,
      I18nContent.HINT_AMAP: I18nContent.HINT_AMAP,
      I18nContent.HINT_TX_MAP: I18nContent.HINT_TX_MAP,
      I18nContent.HINT_BDMAP: I18nContent.HINT_BDMAP,
      I18nContent.HINT_APPLE_MAP: I18nContent.HINT_APPLE_MAP,
      // 位置加载中
      I18nContent.POSITIONLOADING : I18nContent.POSITIONLOADING,
      // 过会儿再试试
      I18nContent.LATETRY : I18nContent.LATETRY,
      // 全部已读提示
      I18nContent.ALLREADHINT : I18nContent.ALLREADHINT,
      I18nContent.AUTHLOGINHINT : I18nContent.AUTHLOGINHINT,
      I18nContent.ERRORLOCATION : I18nContent.ERRORLOCATION,
      I18nContent.TELECOM: I18nContent.TELECOM,
      I18nContent.PROVIDESERVICE : I18nContent.PROVIDESERVICE,
      I18nContent.PLATFORMSERVER : I18nContent.PLATFORMSERVER,
      I18nContent.PRIVACYPOLICY : I18nContent.PRIVACYPOLICY,
      I18nContent.INPUTPHONE : I18nContent.INPUTPHONE,
      I18nContent.INPUTPASSWORD : I18nContent.INPUTPASSWORD,
      I18nContent.INPUTCODE : I18nContent.INPUTCODE,
      I18nContent.AGREEPRO : I18nContent.AGREEPRO,
      I18nContent.INPUTTITLE : I18nContent.INPUTTITLE,

      /// 文字
      I18nContent.TAGLINE : I18nContent.TAGLINE,
      I18nContent.USER_TAGLINE : I18nContent.USER_TAGLINE,
      I18nContent.PRICE : I18nContent.PRICE,
      I18nContent.UNIT : I18nContent.UNIT,
      I18nContent.FANS : I18nContent.FANS,
      // 宝贝介绍
      I18nContent.ARTICLEINTRODUCTION : I18nContent.ARTICLEINTRODUCTION,
      I18nContent.AGREEMENT : I18nContent.AGREEMENT,
      I18nContent.AUTHORIZATION : I18nContent.AUTHORIZATION,
      I18nContent.ACCPASLOGIN : I18nContent.ACCPASLOGIN,
      I18nContent.CODELOGIN : I18nContent.CODELOGIN,
      I18nContent.AND : I18nContent.AND,
      I18nContent.NOINFO : I18nContent.NOINFO,
      I18nContent.NOINFOHINT : I18nContent.NOINFOHINT,
      I18nContent.NOPURCHASED : I18nContent.NOPURCHASED,
      I18nContent.NOPURCHASEDHINT : I18nContent.NOPURCHASEDHINT,
      I18nContent.NOSOLD : I18nContent.NOSOLD,
      I18nContent.NOSOLDHINT : I18nContent.NOSOLDHINT,
      I18nContent.NORELEASED : I18nContent.NORELEASED,
      I18nContent.NORELEASEDHINT : I18nContent.NORELEASEDHINT,
      I18nContent.NOPOST : I18nContent.NOPOST,
      I18nContent.NOHISTORY : I18nContent.NOHISTORY,
      I18nContent.NOCOLLECT : I18nContent.NOCOLLECT,
    }
  };
}