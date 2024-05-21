import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  var isDone = false.obs;
  var isOpenMenu = false.obs;
  var title = ''.obs;

  ItemController(String title) {
    this.title.value = title;
  }

  void toggleDone() {
    isDone.value = !isDone.value;
  }
  
  void toggleOpenMenu() {
    isOpenMenu.value = !isOpenMenu.value;
  }
}
