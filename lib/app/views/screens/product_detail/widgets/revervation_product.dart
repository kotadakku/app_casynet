
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../theme/app_colors.dart';

class RevervationProductWidget extends StatelessWidget {
  const RevervationProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Chọn cửa hàng',
      'Item2',
      'Item3',
      'Item4',
      'Item5',
      'Item6',
      'Item7',
      'Item8',
    ];
    var selectedValue = 'Chọn cửa hàng'.obs;
    TextEditingController date_controller = TextEditingController();
    TextEditingController hours_controller = TextEditingController();
    TextEditingController note_controller = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            width: double.maxFinite,
            child: Obx(()=>DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Row(
                  children: const [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                      color: kTextColor_gray,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
                    .toList(),
                value: selectedValue.value,
                onChanged: (value) {

                    selectedValue.value = value as String;
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                ),
                iconSize: 18,
                iconEnabledColor: kTextColor,
                iconDisabledColor: kTextColor_gray,
                buttonHeight: 50,
                buttonWidth: 160,
                buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  border: Border.all(
                    color: kTextColor,
                  ),
                  color: Colors.white
                ),
                buttonElevation: 0,
                itemHeight: 40,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 200,
                dropdownPadding: null,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: Colors.white,
                ),
                dropdownElevation: 8,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                offset: const Offset(0, 0),
              ),
            ))
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                      height: 30,
                      color: Colors.white,
                      child: TextField(
                        readOnly: true,
                        autofocus: false,
                        controller: date_controller,
                        style: TextStyle(
                          color: kTextColor_gray,
                          fontSize: 13
                        ),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kYellowColor, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kTextColor, width: 1.0),
                          ),
                          prefixIcon: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: (){
                              DatePicker.showTimePicker(context,
                                  showTitleActions: true,
                                  onChanged: (hours) {
                                  },
                                  onConfirm: (hours) {
                                    // hours_controller.text = DateFormat('hh:mm').format(hours).toString();
                                  },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            },
                            child: Container(
                                padding: EdgeInsets.all(5.0),
                                child: SvgPicture.asset(
                                  'assets/product_detail/calendar-alt.svg',
                                  height: 14,
                                  color: kTextColor,
                                )
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: (){
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  onChanged: (date) {
                                  },
                                  onConfirm: (date) {
                                    date_controller.text = DateFormat('yyyy/MM/dd').format(date).toString();
                                  },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.vi);
                            },
                            child: Icon(Icons.arrow_drop_down, color: kTextColor),
                          ),
                          suffixIconConstraints: BoxConstraints(
                            maxWidth: 30,
                            minHeight: 30,
                          ),
                          prefixIconConstraints: BoxConstraints(
                            maxWidth: 30,
                            minHeight: 30,
                          )
                        ),
                      )
                  )
              ),
              SizedBox(width: 10,),
              Flexible(
                  flex: 1,
                  child: Container(
                      height: 30,
                      color: Colors.white,
                      child: TextField(
                        controller: hours_controller,
                        readOnly: true,
                        autofocus: false,
                        style: TextStyle(
                          color: kTextColor_gray,
                          fontSize: 13
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kYellowColor, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kTextColor, width: 1.0),
                          ),

                          prefixIcon: Container(
                              padding: EdgeInsets.all(5.0),
                              child: SvgPicture.asset(
                                'assets/product_detail/ic_alarm.svg',
                                height: 14,
                                color: kTextColor,
                              )
                          ),
                          suffixIcon: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                            DatePicker.showTimePicker(context,
                                showTitleActions: true,
                                onChanged: (hours) {
                                },
                                onConfirm: (hours) {
                                  hours_controller.text = DateFormat('HH:mm').format(hours).toString();
                                },
                                currentTime: DateTime.now(),
                                locale: LocaleType.vi);
                          },
                          child: Icon(Icons.arrow_drop_down, color: kTextColor),
                        ),
                          prefixIconConstraints: BoxConstraints(
                            maxWidth: 30,
                            minHeight: 30,
                          ),
                          suffixIconConstraints: BoxConstraints(
                            maxWidth: 30,
                            minHeight: 30,
                          )
                        ),
                      )
                  )
              ),
            ],

          ),
          SizedBox(height: 10,),

          TextField(
            controller: note_controller,
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            style: TextStyle(
                color: kTextColor_gray,
                fontSize: 13
            ),
            cursorColor: kTextColor_gray,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              hintText: "Điền ghi chú tại đây ...",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kYellowColor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kTextColor, width: 1.0),
              ),
              hintStyle: TextStyle(
                fontSize: 12,
                color: kTextColor,
              ),
            ),

          ),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: (){},
                child: Text("DONE Đặt chỗ ngay",
                  style: TextStyle(
                  ),
                ),
              style: ElevatedButton.styleFrom(
                primary: kYellowColor
              ),

            ),
          ),
          Row(
            children: [
              SvgPicture.asset("assets/product_detail/phone-volume.svg", height: 20),
              SizedBox(width: 5,),
              Text("Hoặc gọi tới: "),
              Text("0962.68.87.68" , style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
          SizedBox(height: 5.0,),
          Text("Để đặt chỗ và được tư vấn")
        ],
      ),
    );
  }
}
