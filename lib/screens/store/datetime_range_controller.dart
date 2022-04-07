

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DateTimeRangeController extends GetxController {
  // var selectedDate = DateTime.now().obs;
  var dateRange = DateTimeRange(
          start: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 6),
          end: DateTime.now())
      .obs;

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}

  chooseDateRangePicker() async {
    DateTimeRange? pickedDate = await showDateRangePicker(
        context: Get.context!,
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 20),
        initialDateRange: dateRange.value,
        builder: (context, child) {
          return Theme(data: ThemeData.fallback(), child: child!)
        } ,
    );

    if (pickedDate != null && pickedDate != dateRange.value) {
      dateRange.value = pickedDate;
    }
  }
}
