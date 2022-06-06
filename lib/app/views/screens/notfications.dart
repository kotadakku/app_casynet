import 'package:app_casynet/app/views/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utlis/service/notication_service.dart';
import '../widgets/appbar/appbar_home_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _menus = [
      ListTile(
        // Ảnh thông báo
        leading: Image.asset("assets/images/notification/noti_1.png"),
        // Tên thông báo
        title: Text("Casynet gui KH don hang #221635372"),
        // Chi tiết thông báo
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("Khoa Hoc Thiet Ke"), Text("17:01 14-03-2020")],
        ),
      ),
      ListTile(
        leading: Image.asset("assets/images/notification/noti_1.png"),
        title: Text("Casynet gui KH don hang #221635372"),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("Khoa Hoc Thiet Ke"), Text("17:01 14-03-2020")],
        ),
      ),
      ListTile(
        leading: Image.asset("assets/images/notification/noti_1.png"),
        title: Text("Casynet gui KH don hang #221635372"),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("Khoa Hoc Thiet Ke"), Text("17:01 14-03-2020")],
        ),
      ),
      ListTile(
        leading: Image.asset("assets/images/notification/noti_1.png"),
        title: Text("Casynet gui KH don hang #221635372"),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("Khoa Hoc Thiet Ke"), Text("17:01 14-03-2020")],
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBarHomeWidget(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              width: double.infinity,
              color: Color(0xffF1F3FD),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(
                  'noti'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),

          // Danh sách thông báo
          Expanded(
              child: GetBuilder<NotificationService>(
                  init: NotificationService(),
                  builder: (controller) {
                    return controller.notificationList.length <= 0
                        ? Text("Không có thông báo để hiển thị")
                        : ListView.builder(
                            itemCount: controller.notificationList.length, // You should pass the itemCount parameter to the ListView.builder to allow it to know the item count
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key: Key(controller.notificationList[index].toString()),
                                onDismissed: (direction) {
                                  controller.deleteNotificationItem(index,int.parse(controller.notificationList[index].dataId));
                                },
                                child: Container(
                                  color:
                                      controller.notificationList[index].isSeen
                                          ? AppColors.backgroundColor
                                          : Colors.blue,
                                  margin: EdgeInsets.only(top: 5.0.h),
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  child: ListTile(
                                    leading: Image.network(controller
                                            .notificationList[index]
                                            .dataImageUrl ??
                                        controller
                                            .notificationList[index].imageUrl!),
                                    title: Text(controller
                                            .notificationList[index].dataBody ??
                                        controller
                                            .notificationList[index].body!),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(controller.notificationList[index]
                                                .dataTitle ??
                                            controller.notificationList[index]
                                                .title!),
                                        Text(controller
                                            .notificationList[index].timeReceive
                                            .toString())
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                  }))
        ],
      ),
    );
  }
}
