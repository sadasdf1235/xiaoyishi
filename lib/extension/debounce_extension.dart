import 'dart:async';

/// 防抖
/// 防抖是延时操作，在触发事件时，不立即执行目标操作，而是给出一个延迟的时间，
/// 如果在指定的时间区间内再次触发了事件，则重置延时时间，只有当延时时间走完了才会真正执行。
extension DebounceExtension on Function {
  void Function() debounce([int milliseconds = 1000]) {
    Timer? _debounceTimer;
    return () {
      if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();
      _debounceTimer = Timer(Duration(milliseconds: milliseconds), () {
        this();
      });
    };
  }
}
