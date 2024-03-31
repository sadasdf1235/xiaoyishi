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

      /// 按钮
      I18nContent.CONFIRM : '确定',
      I18nContent.CANCEL : '取消',
      I18nContent.SETTING : '设置',
      I18nContent.HELP : '帮助',
      I18nContent.LOCATION: '位置',
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
    }
  };
}