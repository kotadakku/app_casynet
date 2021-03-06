import 'package:app_casynet/app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../data.dart';
import '../../../theme/app_colors.dart';
import '../../seller_detail/widgets/card_chat_item.dart';

class ChatProductWidget extends StatelessWidget {
  ChatProductWidget({Key? key}) : super(key: key);
  final DetailProductController _detailProductController = Get.find();

  @override
  Widget build(BuildContext context) {
    var isReadMore = false.obs;
    return ListView(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('qa'.tr,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),),
              Text("${chats.length} ${'qa'.tr}",
              style: const TextStyle(
                  color: AppColors.textGrayColor
              ),)
            ],
          ),
        ),
        const Divider(
          height: 10,
          color: AppColors.textGrayColor,
        ),

        Obx(()=>ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: _detailProductController.rateCmtList.length,
          itemBuilder: (context, index) => CardChatItem(
            rate: _detailProductController.rateCmtList[index],
          )
          ,
        )),
        const Divider(height: 20,),
        GestureDetector(
          onTap: (){
            isReadMore.value = !isReadMore.value;
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(()=>Text(isReadMore.value ? 'hide'.tr : 'see_all'.tr, style: const TextStyle(
                color: AppColors.yellowColor,
              ),)),
              Obx(()=>Icon(isReadMore.value ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded, color: AppColors.yellowColor,))
            ],
          ),
        ),

        const SizedBox(height: 10,),

      ],
    );
  }

}


// class CardChatItem extends StatelessWidget {
//   final bool isFromMe;
//   final String nameCompany;
//   final String message;
//   final String time;
//   const CardChatItem({Key? key, isMe, required this.isFromMe, required this.nameCompany, required this.message, required this.time, nameUser}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 10.w, right: 30.w, top: 10.h, bottom: 10.h),
//       margin: EdgeInsets.only(left: isFromMe ? 30.w : 0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.horizontal(left: Radius.circular(10.0)),
//         color: isFromMe ? Colors.blue.withOpacity(.1) : Colors.white,
//       ),
//       child: Row(
//         children: [
//           Container(
//             height: 40,
//             width: 40,
//             margin: EdgeInsets.all(5.0),
//             decoration: BoxDecoration(
//
//                 borderRadius: BorderRadius.circular(20.0),
//                 image: DecorationImage(
//                   image: AssetImage("assets/images/account/image_user.png"),
//                   fit: BoxFit.fill,
//                 )
//             ),
//           ),
//           Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         width: 150,
//                         child: Text(nameCompany, style: TextStyle(
//                             overflow: TextOverflow.ellipsis,
//                             color: Colors.blue,
//
//                             fontWeight: FontWeight.bold
//                         ),
//                         ),
//                       ),
//                       Text(time,
//                         style: TextStyle(
//                             color: AppColors.textGrayColor
//                         ),
//
//                       )
//                     ],
//                   ),
//
//                   SizedBox(height: 10,),
//                   Text(message)
//                 ],
//               ))
//         ],
//       ),
//     );
//   }
// }

