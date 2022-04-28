import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class TopDetailProductWidget extends StatelessWidget {
  const TopDetailProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: TextField(
        autofocus: false,
        cursorColor: kYellowColor,
        style: TextStyle(
          color: kTextColor_gray,
          fontSize: 13,
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: kYellowColor)),
          hintStyle: const TextStyle(fontSize: 11),
          hintText: 'Search Sản phẩm',
          prefixIcon: SizedBox(
            width: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 5.0),
              child: Icon(
                Icons.search,
                color: kTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
