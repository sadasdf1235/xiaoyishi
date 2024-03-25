import 'package:flutter/material.dart';

import '../constants/icon_code.dart';
class LdIcon extends IconData {
  const LdIcon(super.codePoint);
  static IconData getIcon({required int code, String fontFamily = "iconFonts"}) {
    return IconData(
      code,
      fontFamily: fontFamily,
      matchTextDirection: true,
    );
  }
  /// 导航
  static final IconData discover_act = getIcon(code: IconCode.DISCOVER_ACT);
  static final IconData discover = getIcon(code: IconCode.DISCOVER);
  static final IconData home = getIcon(code: IconCode.HOME);
  static final IconData my_act = getIcon(code: IconCode.MY_ACT);
  static final IconData my = getIcon(code: IconCode.MY);
  static final IconData message = getIcon(code: IconCode.MESSAGE);

  /// 分类
  static final IconData phone = getIcon(code: IconCode.PHONE);
  static final IconData computer = getIcon(code: IconCode.COMPUTER);
  static final IconData car = getIcon(code: IconCode.CAR);
  static final IconData clothes = getIcon(code: IconCode.CLOTHES);
  static final IconData book = getIcon(code: IconCode.PHONE);
  static final IconData bed = getIcon(code: IconCode.BED);
  static final IconData package = getIcon(code: IconCode.PACKAGE);
  static final IconData music_inst = getIcon(code: IconCode.MUSICAL_INST);
  static final IconData house = getIcon(code: IconCode.HOUSE);
  static final IconData game = getIcon(code: IconCode.GAME);
  static final IconData other = getIcon(code: IconCode.OTHER);
  static final IconData all = getIcon(code: IconCode.ALL);
}
