// import 'dart:io';
//
// import 'package:flutter_bmflocation/flutter_bmflocation.dart';
// // import 'package:flutter_bmflocation/bdmap_location_flutter_plugin.dart';
//
// class BdMapUtil {
//   // 初始化定位插件类
//   final LocationFlutterPlugin _myLocPlugin = LocationFlutterPlugin();
//
//   // 设置是否同意隐私政策
// // 隐私政策官网链接：https://lbsyun.baidu.com/index.php?title=openprivacy
// // 未同意隐私政策之前无法使用定位及地理围栏等功能。
// //   Future<bool> setAgreePrivacy(bool isAgree) async {
// //     return BMFLocationDispatcherFactory.instance.authDispatcher.setAgreePrivacy(_channel, isAgree);
// //   }
//
//   /// 设置定位
//   _setLocOption(){
//     // android 定位参数
//     BaiduLocationAndroidOption initAndroidOptions() {
//       BaiduLocationAndroidOption options = BaiduLocationAndroidOption(
// // 定位模式，可选的模式有高精度、仅设备、仅网络。默认为高精度模式
//           locationMode: BMFLocationMode.hightAccuracy,
// // 是否需要返回地址信息
//           isNeedAddress: true,
// // 是否需要返回海拔高度信息
//           isNeedAltitude: true,
// // 是否需要返回周边poi信息
//           isNeedLocationPoiList: true,
// // 是否需要返回新版本rgc信息
//           isNeedNewVersionRgc: true,
// // 是否需要返回位置描述信息
//           isNeedLocationDescribe: true,
// // 是否使用gps
//           openGps: true,
// // 可选，设置场景定位参数，包括签到场景、运动场景、出行场景
//           locationPurpose: BMFLocationPurpose.sport,
// // 坐标系
//           coordType: BMFLocationCoordType.bd09ll,
// // 设置发起定位请求的间隔，int类型，单位ms
// // 如果设置为0，则代表单次定位，即仅定位一次，默认为0
//           scanspan: 0);
//       return options;
//     }
//     // ios  定位参数
//     BaiduLocationIOSOption initIOSOptions() {
//       BaiduLocationIOSOption options = BaiduLocationIOSOption(
//         // 坐标系
//         coordType: BMFLocationCoordType.bd09ll,
//         // 位置获取超时时间
//         locationTimeout: 10,
//         // 获取地址信息超时时间
//         reGeocodeTimeout: 10,
//         // 应用位置类型 默认为automotiveNavigation
//         activityType: BMFActivityType.automotiveNavigation,
//         // 设置预期精度参数 默认为best
//         desiredAccuracy: BMFDesiredAccuracy.best,
//         // 是否需要最新版本rgc数据
//         isNeedNewVersionRgc: true,
//         // 指定定位是否会被系统自动暂停
//         pausesLocationUpdatesAutomatically: false,
//         // 指定是否允许后台定位,
//         // 允许的话是可以进行后台定位的，但需要项目配置允许后台定位，否则会报错，具体参考开发文档
//         allowsBackgroundLocationUpdates: true,
//         // 设定定位的最小更新距离
//         distanceFilter: 10,
//       );
//       return options;
//     }
//     Map iosMap = initIOSOptions().getMap();
//     Map androidMap = initAndroidOptions().getMap();
//     _myLocPlugin.prepareLoc(androidMap, iosMap);
//   }
//
//   /// 启动定位
//   void startLocation() async{
//     if (null != _myLocPlugin) {
//       await _setLocOption();
//       if (Platform.isIOS) {
//         await _myLocPlugin
//             .singleLocation({'isReGeocode': true, 'isNetworkState': true});
//       } else if (Platform.isAndroid) {
//         await _myLocPlugin.startLocation();
//       }
//     }
//   }
//
//   /// 停止定位
//   void stopLocation() {
//     if (null != _myLocPlugin) {
//       _myLocPlugin.stopLocation();
//     }
//   }
//
//   getResult(){
//     BaiduLocation? bdResult;
//     if (Platform.isIOS) {
//       //接受定位回调
//       _myLocPlugin.singleLocationCallback(callback: (BaiduLocation result) {
//         //result为定位结果
//         bdResult = result;
//       });
//     } else if (Platform.isAndroid) {
//       //接受定位回调
//       _myLocPlugin.seriesLocationCallback(callback: (BaiduLocation result) {
//         //result为定位结果
//         bdResult = result;
//       });
//     }else {
//
//     }
//     return bdResult;
//   }
// }
