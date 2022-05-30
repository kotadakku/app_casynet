
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../data.dart';
import '../../../../controller/store_detail/detail_store_controller.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_sizes.dart';
import 'gift_store_widget.dart';

class VoteStoreWidget extends StatelessWidget {
  const VoteStoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isReadMore = false.obs;
    DetailStoreController controller = Get.find<DetailStoreController>();
    return SingleChildScrollView(
      child: Column(
        children: [
          GiftStoreWidget(),
          SizedBox(height: 10,),
          Image.asset("assets/images/detail_store/vote.png", fit: BoxFit.fitWidth),
          Obx(()=>
              Wrap(
                runSpacing: 0,
                spacing: 10.w,
                children: [
                  SizedBox(
                    width: 0.33.sw-15,
                    child:  ElevatedButton(
                      onPressed: (){
                        controller.vote_selected.value = 0;
                      },
                      child: Text("Tất cả (44)",
                        style: TextStyle(
                            color: controller.vote_selected.value == 0 ? Colors.white : kTextColor
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: controller.vote_selected.value == 0 ? kYellowColor : Colors.white,
                          side: BorderSide(
                              color: controller.vote_selected.value == 0 ? kYellowColor: kTextColor
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.33.sw-15,
                    child:  ElevatedButton(
                      onPressed: (){
                        controller.vote_selected.value = 5;
                      },
                      child: Text("5 Sao (12)",
                        style: TextStyle(
                            color: controller.vote_selected.value == 5 ? Colors.white : kTextColor
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: controller.vote_selected.value == 5 ? kYellowColor : Colors.white,
                          side: BorderSide(
                              color: controller.vote_selected.value == 5 ? kYellowColor: kTextColor
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.33.sw-15,
                    child:  ElevatedButton(
                      onPressed: (){
                        controller.vote_selected.value = 4;
                      },
                      child: Text("4 Sao (12)",
                        style: TextStyle(
                            color: controller.vote_selected.value == 4 ? Colors.white : kTextColor
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: controller.vote_selected.value == 4 ? kYellowColor : Colors.white,
                          side: BorderSide(
                              color: controller.vote_selected.value == 4 ? kYellowColor: kTextColor
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.33.sw-15,
                    child:  ElevatedButton(
                      onPressed: (){
                        controller.vote_selected.value = 3;
                      },
                      child: Text("3 Sao (12)",
                        style: TextStyle(
                            color: controller.vote_selected.value == 3 ? Colors.white : kTextColor
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: controller.vote_selected.value == 3 ? kYellowColor : Colors.white,
                          side: BorderSide(
                              color: controller.vote_selected.value == 3 ? kYellowColor: kTextColor
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.33.sw-15,
                    child:  ElevatedButton(
                      onPressed: (){
                        controller.vote_selected.value = 2;
                      },
                      child: Text("2 Sao (12)",
                        style: TextStyle(
                            color: controller.vote_selected.value == 2 ? Colors.white : kTextColor
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: controller.vote_selected.value == 2 ? kYellowColor : Colors.white,
                          side: BorderSide(
                              color: controller.vote_selected.value == 2 ? kYellowColor: kTextColor
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.33.sw-15,
                    child:  ElevatedButton(
                      onPressed: (){
                        controller.vote_selected.value = 1;
                      },
                      child: Text("1 Sao (12)",
                        style: TextStyle(
                            color: controller.vote_selected.value == 1 ? Colors.white : kTextColor
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: controller.vote_selected.value == 1 ? kYellowColor : Colors.white,
                          side: BorderSide(
                              color: controller.vote_selected.value == 1 ? kYellowColor: kTextColor
                          )
                      ),
                    ),
                  ),

                ],
              ),
          ),
          Container(
            color: kBackgroundColor,
            height: 10,
          ),
          Obx(()=>ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: isReadMore.value ? 5: chats.length,
              itemBuilder: (context, index){
                return CardChatItem(isFromMe: chats[index]['isMe'], nameUser:  chats[index]['user_name'], message:  chats[index]['content']);
              }
          )),
          Divider(),
          GestureDetector(
            onTap: (){
              isReadMore.value = !isReadMore.value;
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(()=>Text(isReadMore.value ? "Xem thêm": "Ẩn bớt", style: TextStyle(
                    color: kYellowColor
                ),),),
                Obx(()=>Container(
                  margin: EdgeInsets.all(5.0),
                  child: Icon(isReadMore.value ? Icons.keyboard_arrow_down_sharp : Icons.keyboard_arrow_up_sharp, color: kYellowColor, size: 15,),
                ))

              ],
            ),
          )

        ],
      ),
    );
  }
}

class CardChatItem extends StatelessWidget {
  final bool isFromMe;
  final String nameUser;
  final String message;
  const CardChatItem({Key? key, isMe, required this.isFromMe, required this.nameUser, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 30.w, top: 10.h, bottom: 10.h),
      margin: EdgeInsets.only(left: isFromMe ? 30.w : 0, bottom: 5.h, top:5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(10.0)),
        color: isFromMe ? Colors.blue.withOpacity(.1) : Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: AssetImage("assets/images/account/image_user.png"),
                  fit: BoxFit.fill,
                )
            ),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    child: Text(nameUser, style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.blue,
                      // fontWeight: FontWeight.w400
                    ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if(isFromMe)
                      Row(
                        children: [
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_half_outlined , size: sizeIcon.width, color: kYellowColor,),
                        ],
                      ),
                      if(isFromMe) SizedBox(width: 10,),
                      Text("10:30 03/30/2020",
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 12
                        ),

                      )
                    ],
                  ),

                  SizedBox(height: 10,),
                  Text(message)
                ],
              )),

        ],
      ),
    );
  }
}
