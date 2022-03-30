
import 'package:app_casynet/containts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';




class TopHomeWidget extends StatelessWidget {
  const TopHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              child: SvgPicture.asset(
                "assets/home/icon_top_home.svg",
                width: 40,
              )
            )
          ),
          Flexible(
            flex: 6,
            fit: FlexFit.tight,
            child: Container(
              height: 35,
              child:  TextField(
                autofocus: false,
                style: TextStyle(
                    fontSize: 13
                ),
                textAlignVertical: TextAlignVertical.center,
                cursorColor: kYellowColor,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    hintStyle: const TextStyle(
                        fontSize: 11
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: kYellowColor
                      )

                    ),
                    hintText: 'Search Casynet',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          VerticalDivider(
                            width: 20,
                            thickness: 1,
                            indent: 5,
                            endIndent: 5,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 2.0,),
                          SvgPicture.asset(
                            "assets/home/icon_location.svg",
                            width: 14),
                          const SizedBox(width: 5.0,),
                          const Text(
                            "Hà Nội",
                          ),
                          const SizedBox(width: 5.0,),
                        ],
                      ),
                    )
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1 ,
            fit: FlexFit.tight,
            child: Center(child: Text("VN")
            )
          )
        ],
      ),
    );

  }
}
