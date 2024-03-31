import 'dart:async';

/// 节流
/// 节流是忽略操作，在触发事件时，立即执行目标操作，
/// 如果在指定的时间区间内再次触发了事件，则会丢弃该事件不执行，只有超过了指定的时间之后，才会再次触发事件。
// extension ThrottleExtension<T> on Function(T) {
//   void Function(T) throttle([int milliseconds = 1000]) {
//     bool _isAllowed = true;
//     Timer? _throttleTimer;
//     return (T argument) {
//       if (!_isAllowed) return;
//       _isAllowed = false;
//       this(argument);
//       _throttleTimer?.cancel();
//       _throttleTimer = Timer(Duration(milliseconds: milliseconds), () {
//         _isAllowed = true;
//       });
//     };
//   }
// }


/// 原版
extension ThrottleExtension on Function {
  void Function() throttle([int milliseconds = 500]) {
    bool _isAllowed = true;
    Timer? _throttleTimer;
    return () {
      if (!_isAllowed) return;
      _isAllowed = false;
      this();
      _throttleTimer?.cancel();
      _throttleTimer = Timer(Duration(milliseconds: milliseconds), () {
        _isAllowed = true;
      });
    };
  }
}
extension ThrottleValueExtension on Function {
  void Function(dynamic) throttleValue([int milliseconds = 1000]) {
    bool _isAllowed = true;
    Timer? _throttleTimer;
    return (dynamic argument) {
      if (!_isAllowed) return;
      _isAllowed = false;
      this(argument);
      _throttleTimer?.cancel();
      _throttleTimer = Timer(Duration(milliseconds: milliseconds), () {
        _isAllowed = true;
      });
    };
  }
}
