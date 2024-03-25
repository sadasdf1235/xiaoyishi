// import 'package:amap_flutter_location/amap_flutter_location.dart';
// import 'package:amap_flutter_location/amap_location_option.dart';
//
// import '../constants/map_key.dart';
//
// class AmapUtil {
//   /// 定位参数
//   AMapLocationOption locationOption = AMapLocationOption(
//     // 是否需要地址信息
//     needAddress: true,
//     // 逆地理信息语言类型 GeoLanguage.DEFAULT 自动适配
//     geoLanguage: GeoLanguage.DEFAULT,
//     // 是否单次定位
//     onceLocation: true,
//     // Android端定位模式
//     locationMode: AMapLocationMode.Hight_Accuracy,
//     // Android端定位间隔 毫秒
//     locationInterval: 2000,
//     // iOS端期望的定位精度
//     desiredAccuracy: DesiredAccuracy.Best,
//     // iOS端定位最小更新距离 米 -1不做限制
//     distanceFilter: -1,
//     // iOS 14中设置期望的定位精度权限
//     desiredLocationAccuracyAuthorizationMode:
//         AMapLocationAccuracyAuthorizationMode.FullAccuracy,
//     // iOS 14中定位精度权限由模糊定位升级到精确定位时，需要用到的场景key fullAccuracyPurposeKey 这个key要和plist中的配置一样
//     // fullAccuracyPurposeKey : "",
//   );
//
//   AMapFlutterLocation aMapFlutterLocation = AMapFlutterLocation();
//
//   AmapUtil() {
//     /// 添加高德ApiKey
//     AMapFlutterLocation.setApiKey(MapKey.AMAP_ANDROID_KEY, MapKey.AMAP_IOS_KEY);
//
//     // 隐私权政策是否弹窗展示告知用户
//     AMapFlutterLocation.updatePrivacyShow(true, true);
//     // 隐私权政策是否已经取得用户同意
//     AMapFlutterLocation.updatePrivacyAgree(true);
//     // 设置定位参数
//     aMapFlutterLocation.setLocationOption(locationOption);
//   }
//
//   startLocation() {
//     aMapFlutterLocation.startLocation();
//   }
//
//   stopLocation() {
//     aMapFlutterLocation.stopLocation();
//   }
//
//   destroy() {
//     aMapFlutterLocation.destroy();
//   }
//
//   listen() {
//     return aMapFlutterLocation
//         .onLocationChanged()
//         .listen((Map<String, Object> result) => result);
//   }
// }
