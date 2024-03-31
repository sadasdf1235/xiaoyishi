import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../constants/I18n_content.dart';

class LdDialog {
  static void defaultDialog({
    required BuildContext context,
    required String title,
    required String middleText,
    void Function()? onCancel,
    required void Function() onConfirm,
  }) async {
    await showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(middleText),
            actions: <Widget>[
              CupertinoButton(
                child: Text(I18nContent.CANCEL.tr,style: const TextStyle(color: Colors.black38),),
                onPressed: () {
                  Get.back();
                },
              ),
              CupertinoButton(
                child: Text(I18nContent.CONFIRM.tr,style: const TextStyle(color: Colors.black),),
                onPressed: () {
                  onConfirm();
                  Get.back();
                },
              ),
            ],
          );
        });
  }

  static void _cupertinoDialog({
    required BuildContext context,
    required String title,
    String? textCancel,
    String? textConfirm,
    String middleText = 'middleText',
    void Function()? onCancel,
    required void Function() onConfirm,
  }) async {
    textConfirm = textConfirm ?? I18nContent.CONFIRM.tr;
    textCancel = textCancel ?? I18nContent.CANCEL.tr;
    await showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(middleText),
            actions: <Widget>[
              CupertinoButton(
                child: Text(textCancel!),
                onPressed: () {
                  onCancel == null ? Get.back() : onCancel();
                },
              ),
              CupertinoButton(
                child: Text(textConfirm!),
                onPressed: () {
                  onConfirm();
                },
              ),
            ],
          );
        });
  }
}
