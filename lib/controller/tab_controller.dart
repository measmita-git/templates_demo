import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController _controller;

  TabController get controller => _controller;
  late RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _controller = TabController(length: 4, vsync: this);
    _controller.animation?.addListener(() {
      int index = _controller.animation!.value.round();
      if (index != selectedIndex.value) {
        selectedIndex.value = index;
      }
    });
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}
