import 'package:get/get.dart';

import '../constants/I18n_content.dart';
class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN': {
      I18nContent.TAB_HOME: '首页',
      I18nContent.TAB_DISCOVER: '发现',
      I18nContent.TAB_MESSAGE: '消息',
      I18nContent.TAB_USER: '我的',

      I18nContent.HINT: '提示',
      I18nContent.HINT_AMAP: '检测到高德地图~',
      I18nContent.HINT_TX_MAP: '未检测到腾讯地图~',
      I18nContent.HINT_BDMAP: '未检测到百度地图~',
      I18nContent.HINT_APPLE_MAP: '未检测到苹果地图~',

      I18nContent.LOCATION: '位置',
      I18nContent.SEARCHFAVORITES : '搜你喜欢',
    },
    'en_US': {
      I18nContent.TAB_HOME: 'Home',
      I18nContent.TAB_DISCOVER: 'Discover',
      I18nContent.TAB_MESSAGE: 'Message',
      I18nContent.TAB_USER: 'Me',

      I18nContent.HINT: 'Hint',
      I18nContent.HINT_AMAP: 'Amap not detected~',
      I18nContent.HINT_TX_MAP: 'Tencent map not detected~',
      I18nContent.HINT_BDMAP: 'Baidu Map not detected~',
      I18nContent.HINT_APPLE_MAP: 'No Apple Maps detected~',

      I18nContent.LOCATION: 'Location',
      I18nContent.SEARCHFAVORITES : I18nContent.SEARCHFAVORITES,
    }
  };
}