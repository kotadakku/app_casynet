import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';


class WalletVoucherController extends GetxController with GetSingleTickerProviderStateMixin  {
  RxInt num_active = 0.obs;
  RxList listTab = [].obs;

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    listTab.value = ["${'available'.tr} (${num_active.value})", '${'used'.tr}'];
    controller = TabController(vsync: this, length: listTab.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}