

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectRegion extends StatelessWidget {

  const SelectRegion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String title = Get.arguments['title'];
    final List regions = Get.arguments['regions'];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 5,
          leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_outlined, size: 18,),
          ),
          title: Text(title, ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                  itemCount: regions.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (){
                        Get.back(result: regions[index]);
                      },
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(regions[index].name),
                                  Container(height: 10, width: 10, child: Icon(Icons.arrow_forward_ios, size: 12,),)
                                ],
                              )
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  }
              ),
            )
          ],
        )
    );
  }
}
