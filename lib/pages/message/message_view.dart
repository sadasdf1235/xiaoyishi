import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/I18n_content.dart';
import '../../constants/common_colors.dart';
import '../../widgets/space_around.dart';
import '../../widgets/ld_dialog.dart';
import '../../controllers/message_controller.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({super.key});

  PreferredSizeWidget _appBar(context) {
    return AppBar(
      title: Text(
        I18nContent.TAB_MESSAGE.tr,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
      ),
      actions: [
        TextButton.icon(
            onPressed: () {
              controller.invalidClick();

              LdDialog.defaultDialog(
                  context: context,
                  title: I18nContent.ALLREAD.tr,
                  middleText: I18nContent.ALLREADHINT.tr,
                  onConfirm: () {

                  });
            },
            icon: const Icon(
              Icons.checklist,
              color: Color(0xFFadb0bc),
            ),
            label: Text(
              I18nContent.ALLREAD.tr,
              style: TextStyle(color: const Color(0xFFadb0bc), fontSize: 14.sp),
            ))
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: InkWell(
            onTap: (){
              controller.invalidClick();
            },
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.w)),
                  color: const Color(0xFFF1F1F1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.search,
                    color: Color(0xFF666666),
                  ),
                  Text(
                    I18nContent.SEARCHHINT.tr,
                    style: TextStyle(
                        color: const Color(0xFF666666), fontSize: 12.sp),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _messageItem() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFB9C0CA)))),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://ts1.cn.mm.bing.net/th?id=OIP-C._YFRagbOM8FbGUSUJy-m6QAAAA&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"),
        ),
        title: Text("元气少女"),
        subtitle: Text(
          "互粉哦！关注你了",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        trailing: SizedBox(
          width: 110.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('04/12 09/34'),
                  controller.isShowDeleteIcon.value
                      ? const Text('')
                      : SizedBox(
                          width: 13.w,
                          height: 13.w,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                ],
              ),
              controller.isShowDeleteIcon.value
                  ? IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    )
                  : const Text('')
            ],
          ),
        ),
        // 点击
        onTap: () {},
        // 长按
        onLongPress: () {
          controller.updateIconShow();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: _appBar(context),
          body: GestureDetector(
            onTap: (){
                controller.invalidClick();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.w),
              child: ListView(
                children: [
                  _messageItem(),
                  _messageItem(),
                ],
              ),
            ),
          ),
        ));
  }
}
