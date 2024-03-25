import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import '../constants/I18n_content.dart';

class MapGoto {

  /// 高德地图
  static Future<bool> gotoAMap(longitude, latitude) async {
    var url = '${Platform.isAndroid ? 'android' : 'ios'}amap://navi?sourceApplication=amap&lat=$latitude&lon=$longitude&dev=0&style=2';
    bool canLaunchUrl = await launchUrl(strToUri(url: url));

    if (!canLaunchUrl) {
      Get.snackbar(I18nContent.HINT.tr,I18nContent.HINT_AMAP.tr);
    }
    return canLaunchUrl;
  }

  /// 腾讯地图
  static Future<bool> gotoTencentMap(longitude, latitude) async {
    var url = 'qqmap://map/routeplan?type=drive&fromcoord=CurrentLocation&tocoord=$latitude,$longitude&referer=IXHBZ-QIZE4-ZQ6UP-DJYEO-HC2K2-EZBXJ';
    bool canLaunchUrl = await launchUrl(strToUri(url: url));

    if (!canLaunchUrl) {
      Get.snackbar(I18nContent.HINT.tr,I18nContent.HINT_TX_MAP.tr);
    }
    return canLaunchUrl;
  }

  /// 百度地图
  static Future<bool> gotoBaiduMap(longitude, latitude) async {
    var url = 'baidumap://map/direction?destination=$latitude,$longitude&coord_type=bd09ll&mode=driving';
    bool canLaunchUrl = await launchUrl(strToUri(url: url));

    if (!canLaunchUrl) {
      Get.snackbar(I18nContent.HINT.tr,I18nContent.HINT_BDMAP.tr);
    }
    return canLaunchUrl;
  }

  /// 苹果地图
  static Future<bool> _gotoAppleMap(longitude, latitude) async {
    var url = 'http://maps.apple.com/?&daddr=$latitude,$longitude';

    bool canLaunchUrl = await launchUrl(strToUri(url: url));

    if (!canLaunchUrl) {
      Get.snackbar(I18nContent.HINT.tr,I18nContent.HINT_APPLE_MAP.tr);
    }
    return canLaunchUrl;
  }

  static Uri strToUri({required String url}){
    return Uri.parse(url);
  }
}