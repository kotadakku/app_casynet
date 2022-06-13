
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../data.dart';
import '../../../../controller/store_detail/detail_store_controller.dart';
import '../../../theme/app_colors.dart';
import 'card_chat_item.dart';
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
          Image.asset("assets/images/seller_detail/vote.png", fit: BoxFit.fitWidth),
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
                      child: Text("${'all'.tr} (44)",
                        style: TextStyle(
                            color: controller.vote_selected.value == 0 ? Colors.white : AppColors.textGrayColor
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: controller.vote_selected.value == 0 ? AppColors.yellowColor : Colors.white,
                          side: BorderSide(
                              color: controller.vote_selected.value == 0 ? AppColors.yellowColor: AppColors.textGrayColor
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
                      child: Text("5 ${'star'.tr} (12)",
                        style: TextStyle(
                            color: controller.vote_selected.value == 5 ? Colors.white : AppColors.textGrayColor
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: controller.vote_selected.value == 5 ? AppColors.yellowColor : Colors.white,
                          side: BorderSide(
                              color: controller.vote_selected.value == 5 ? AppColors.yellowColor: AppColors.textGrayColor
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
                      child: Text("4 ${'star'.tr} (12)",
                        style: TextStyle(
                            color: controller.vote_selected.value == 4 ? Colors.white : AppColors.textGrayColor
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: controller.vote_selected.value == 4 ? AppColors.yellowColor : Colors.white,
                          side: BorderSide(
                              color: controller.vote_selected.value == 4 ? AppColors.yellowColor: AppColors.textGrayColor
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
                      child: Text("3 ${'star'.tr} (12)",
                        style: TextStyle(
                            color: controller.vote_selected.value == 3 ? Colors.white : AppColors.textGrayColor
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: controller.vote_selected.value == 3 ? AppColors.yellowColor : Colors.white,
                          side: BorderSide(
                              color: controller.vote_selected.value == 3 ? AppColors.yellowColor: AppColors.textGrayColor
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
                      child: Text("2 ${'star'.tr} (12)",
                        style: TextStyle(
                            color: controller.vote_selected.value == 2 ? Colors.white : AppColors.textGrayColor
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: controller.vote_selected.value == 2 ? AppColors.yellowColor : Colors.white,
                          side: BorderSide(
                              color: controller.vote_selected.value == 2 ? AppColors.yellowColor: AppColors.textGrayColor
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
                      child: Text("1 ${'star'.tr} (12)",
                        style: TextStyle(
                            color: controller.vote_selected.value == 1 ? Colors.white : AppColors.textGrayColor
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: controller.vote_selected.value == 1 ? AppColors.yellowColor : Colors.white,
                          side: BorderSide(
                              color: controller.vote_selected.value == 1 ? AppColors.yellowColor: AppColors.textGrayColor
                          )
                      ),
                    ),
                  ),

                ],
              ),
          ),
          Container(
            color: AppColors.backgroundColor,
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
                Obx(()=>Text(isReadMore.value ? 'more'.tr: 'hide'.tr, style: TextStyle(
                    color: AppColors.yellowColor
                ),),),
                Obx(()=>Container(
                  margin: EdgeInsets.all(5.0),
                  child: Icon(isReadMore.value ? Icons.keyboard_arrow_down_sharp : Icons.keyboard_arrow_up_sharp, color: AppColors.yellowColor, size: 15,),
                ))

              ],
            ),
          )

        ],
      ),
    );
  }
}