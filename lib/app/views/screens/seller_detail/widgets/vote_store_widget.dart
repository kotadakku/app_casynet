
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../data.dart';
import '../../../../controller/store_detail/detail_store_controller.dart';
import '../../../theme/app_colors.dart';
import 'card_chat_item.dart';
import 'gift_store_widget.dart';

class VoteStoreWidget extends StatelessWidget {
  VoteStoreWidget({Key? key}) : super(key: key);
  DetailStoreController _detailStoreController = Get.find();

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
          _detailStoreController.rateMe.value.id == null
              ? Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text('Đánh giá ngay',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 25,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  _detailStoreController.rateSeller(rating);
                  print(rating);
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.yellowColor
                                  )
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textGrayColor
                                  )
                              ),
                            ),
                          ),
                        )
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      child: Icon(Icons.send, color: AppColors.textGrayColor,),
                    )

                  ],
                ),
              )
            ],
          )
              : Container(
            padding: EdgeInsets.only(left: 10.w, right: 30.w, top: 10.h, bottom: 10.h),
            margin: EdgeInsets.only(left: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(10.0)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.blueAccent),
                      image: DecorationImage(
                        image: NetworkImage('${_detailStoreController.rateMe.value.avatar}'),
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
                          child: Text('${_detailStoreController.rateMe.value.userName}', style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.blue,
                            // fontWeight: FontWeight.w400
                          ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RatingBarIndicator(
                              rating: _detailStoreController.rateMe.value.rateTotal ?? 0.0,
                              unratedColor: Colors.amber.withOpacity(0.2),
                              itemBuilder: (context, index) => const Icon(
                                Icons.star_outlined,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 18.0,
                              direction: Axis.horizontal,
                            ),

                            SizedBox(width: 10.w,),
                            Text('${_detailStoreController.rateMe.value.rateTotal}',
                              style: TextStyle(
                                  color: AppColors.textGrayColor,
                                  fontSize: 12
                              ),

                            )
                          ],
                        ),

                        SizedBox(height: 10.h,),
                        Text('${_detailStoreController.rateMe.value.content}')
                      ],
                    ))
              ],
            ),
          ),

          Obx(()=> _detailStoreController.rateCmtList.length>0
              ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: _detailStoreController.rateCmtList.length,
                itemBuilder: (context, index) => CardChatItem(
                  rate: _detailStoreController.rateCmtList[index],
                )
              )
              : SizedBox(
                height: 20,
                child: Text('Chưa có bình luận nào'),
              )
          ),

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