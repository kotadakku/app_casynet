
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TopAccountWidget(),
                SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.backgroundColor,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text('contact'.tr,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(width: 1.0, color: AppColors.textGrayColor)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(width: 1.0, color: AppColors.textGrayColor)
                        ),
                        prefixIcon: Icon(Icons.perm_identity),
                        suffixIcon: Container(
                          padding: EdgeInsets.all(20.0),
                          height: 40,
                          width: 40,
                          child: Text("*",
                            style: TextStyle(
                                color: Colors.red
                            ),
                          ),
                        ),
                        hintText: 'name'.tr,
                        hintStyle: TextStyle(
                            color: AppColors.textGrayColor,
                            fontSize: 14
                        )
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(width: 1.0, color: AppColors.textGrayColor)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(width: 1.0, color: AppColors.textGrayColor)
                        ),
                        prefixIcon: Icon(Icons.email_outlined),
                        suffixIcon: Container(
                          padding: EdgeInsets.all(20.0),
                          height: 40,
                          width: 40,
                          child: Text("*",
                            style: TextStyle(
                                color: Colors.red
                            ),
                          ),
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(
                            color: AppColors.textGrayColor,
                            fontSize: 14
                        )
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(width: 1.0, color: AppColors.textGrayColor)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(width: 1.0, color: AppColors.textGrayColor)
                        ),
                        prefixIcon: Icon(Icons.call_outlined),
                        suffixIcon: Container(
                          padding: EdgeInsets.all(20.0),
                          height: 40,
                          width: 40,
                          child: Text("*",
                            style: TextStyle(
                                color: Colors.red
                            ),
                          ),
                        ),
                        hintText: 'phone'.tr,
                        hintStyle: TextStyle(
                            color: AppColors.textGrayColor,
                            fontSize: 14
                        )
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(width: 1.0, color: AppColors.textGrayColor)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(width: 1.0, color: AppColors.textGrayColor)
                        ),
                        prefixIcon: Container(
                          padding: EdgeInsets.all(20.0),
                          alignment: Alignment.topRight,
                          width: 40,
                          child: Icon(Icons.email_outlined),
                        ),
                        suffixIcon: Container(
                          padding: EdgeInsets.all(20.0),
                          alignment: Alignment.topRight,
                          width: 40,
                          child: Text("*",
                            style: TextStyle(
                                color: Colors.red
                            ),
                          ),
                        ),
                        hintText: "N???i dung",
                        hintStyle: TextStyle(
                            color: AppColors.textGrayColor,
                            fontSize: 14
                        )
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text("G???i"),
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.yellowColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        )
                    ),
                  ),
                ),
                Expanded(child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage("assets/images/filter/image83.png")
                    )
                  ),
                ))

              ],
            ),
          ),
        )
      ),
    );
  }
}
