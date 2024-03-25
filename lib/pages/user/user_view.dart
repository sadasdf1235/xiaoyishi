import 'package:flutter/material.dart';
import 'package:get/get.dart';
class UserView extends GetView {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("我的"),
      ),
    );
  }
}
