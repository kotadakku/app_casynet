

import 'package:intl/intl.dart';

class IntToPrice{
  final int? priceInt;

  IntToPrice(this.priceInt);

  String intToPrice(){
    final oCcy = NumberFormat("#,##0", "en_US");
    return oCcy.format(priceInt);
  }
}