import 'dart:async';

import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_location/amap_location_option.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants/map_key.dart';

class AmapUtil {
  /// 定位参数
  AMapLocationOption locationOption = AMapLocationOption(
    // 是否需要地址信息
    needAddress: true,
    // 逆地理信息语言类型 GeoLanguage.DEFAULT 自动适配
    geoLanguage: GeoLanguage.DEFAULT,
    // 是否单次定位
    onceLocation: true,
    // Android端定位模式
    locationMode: AMapLocationMode.Hight_Accuracy,
    // Android端定位间隔 毫秒
    locationInterval: 2000,
    // iOS端期望的定位精度
    desiredAccuracy: DesiredAccuracy.Best,
    // iOS端定位最小更新距离 米 -1不做限制
    distanceFilter: -1,
    // iOS 14中设置期望的定位精度权限
    desiredLocationAccuracyAuthorizationMode:
        AMapLocationAccuracyAuthorizationMode.FullAccuracy,
    // iOS 14中定位精度权限由模糊定位升级到精确定位时，需要用到的场景key fullAccuracyPurposeKey 这个key要和plist中的配置一样
    // fullAccuracyPurposeKey : "",
  );

  StreamSubscription<Map<String, Object>>? _locationListener;
  final AMapFlutterLocation _locationPlugin = AMapFlutterLocation();
  PermissionStatus? status;

  AmapUtil() {
    /// 添加高德ApiKey
    AMapFlutterLocation.setApiKey(MapKey.AMAP_ANDROID_KEY, MapKey.AMAP_IOS_KEY);

    /// 设置是否已经包含高德隐私政策并弹窗展示显示用户查看，如果未包含或者没有弹窗展示，高德定位SDK将不会工作
    ///
    /// 高德SDK合规使用方案请参考官网地址：https://lbs.amap.com/news/sdkhgsy
    /// <b>必须保证在调用定位功能之前调用， 建议首次启动App时弹出《隐私政策》并取得用户同意</b>
    ///
    /// 高德SDK合规使用方案请参考官网地址：https://lbs.amap.com/news/sdkhgsy
    ///
    /// [hasContains] 隐私声明中是否包含高德隐私政策说明
    ///
    /// [hasShow] 隐私权政策是否弹窗展示告知用户
    AMapFlutterLocation.updatePrivacyShow(true, true);

    /// 设置是否已经取得用户同意，如果未取得用户同意，高德定位SDK将不会工作
    ///
    /// 高德SDK合规使用方案请参考官网地址：https://lbs.amap.com/news/sdkhgsy
    ///
    /// <b>必须保证在调用定位功能之前调用, 建议首次启动App时弹出《隐私政策》并取得用户同意</b>
    ///
    /// [hasAgree] 隐私权政策是否已经取得用户同意
    AMapFlutterLocation.updatePrivacyAgree(true);

  }

  /// 动态申请定位权限
  Future<bool> _requestPermission() async {
    status = await Permission.location.status;

    if (status == PermissionStatus.granted) {
      return true;
    } else {
      //未授权则发起一次申请
      status = await Permission.location.request();
      print('status=$status');
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }


  Future<void> getCurrentLocation(Function(Map result) onLocationChanged,{once=true}) async {

    bool isPermitted =  await _requestPermission();
    print('isPermitted=$isPermitted');
    if(!isPermitted){
      throw('请在手机设置中开启本app位置权限');
    }

    if(isPermitted){
      ///注册定位结果监听
        _locationListener = _locationPlugin.onLocationChanged().listen((Map<String, Object> result) {
          onLocationChanged(result);
          if (result['longitude'] != null) {
            print("当前位置：$result");
            if(once) _stopLocation();
          }
        });
      }
      _startLocation();
  }

  ///设置定位参数
  void _setLocationOption() {
    AMapLocationOption locationOption = AMapLocationOption();

    if(null != _locationPlugin) {
      ///将定位参数设置给定位插件
      _locationPlugin.setLocationOption(locationOption);
    }
  }

  ///开始定位
  void _startLocation() {
    if(null != _locationPlugin){
      _setLocationOption();
      _locationPlugin.startLocation();
    }
  }

  ///停止定位
  void _stopLocation() {
    if(null != _locationPlugin){
      _locationPlugin.stopLocation();
    }
  }

  /// 销毁定位
  void _destoryLocation(){
    if(null != _locationPlugin){
      _locationPlugin.destroy();
    }
  }

  void cancel() {
    if (null != _locationListener) {
      _locationListener?.cancel(); // 停止定位
    }
    if(null != _locationPlugin){
      _destoryLocation();
    }
  }
}
